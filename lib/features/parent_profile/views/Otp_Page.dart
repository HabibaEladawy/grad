
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_text_styles.dart';
import '../../../core/utils/app_colors.dart' hide AppColors;
import '../../../core/utils/app_text.dart';
import '../../../core/widgets/Otp_Field.dart';
import '../../../core/widgets/Timer_Widget.dart';
import '../../home/presentation/screens/home_screen.dart';
import '../bottom_sheets/new_password_bottom_sheet.dart';
import 'new_password_page.dart';

enum OtpMode { login, signup, forgotPassword, changePassword }

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.mode});
  static String id = 'OtpPage';

  final OtpMode mode;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final String num = '9876 5432 11 02+';
  final GlobalKey<TimerWidgetState> _timerKey = GlobalKey<TimerWidgetState>();
  final GlobalKey<OtpFieldState> _otpKey = GlobalKey<OtpFieldState>();
  bool _canResend = false;

  void _onResendPressed() {
    if (!_canResend) return;

    setState(() => _canResend = false);
    _otpKey.currentState?.clearFields();
    _timerKey.currentState?.restartTimer();
  }

  void _onOtpCompleted() {
    if (widget.mode == OtpMode.login) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    } else if (widget.mode == OtpMode.forgotPassword) {
      Navigator.pushNamed(context, NewPasswordPage.id);
    } else if (widget.mode == OtpMode.signup) {
      // Navigator.pushNamed(context, CreatePasswordScreen.id);
    } else if (widget.mode == OtpMode.changePassword) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.bg_surface_default_light,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        builder: (_) => NewPasswordBottomSheet(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_surface_default_light,
      body: Padding(
        padding: EdgeInsets.only(top: 34.5.h, right: 24.w, left: 24.w),
        child: ListView(
          children: [
            AppTextStyleFonts.headingLargeText(text: 'اكتب رمز التأكيد اللي جالك'),
            AppTextStyleFonts.bodyText(text: 'بعتنالك كود مكوّن من 5 أرقام على رقمك'),
            AppTextStyleFonts.bodyText(
              text: '$num دخل الكود هنا عشان نأكد إن الرقم بتاعك مظبوط',
            ),
            SizedBox(height: 32.h),
            OtpField(key: _otpKey, onCompleted: _onOtpCompleted),
            Padding(
              padding: EdgeInsets.only(top: 82.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimerWidget(
                    key: _timerKey,
                    onTimerFinished: () {
                      setState(() => _canResend = true);
                    },
                  ),
                  SizedBox(width: 8.w),
                  AppTextStyleFonts.clickableText(
                    onTap: _onResendPressed,
                    text: 'أرسلك كود تاني ؟',
                    fontSize: 16,
                    color: _canResend
                        ? AppColors.primary_default_light
                        : const Color(0xffA7D7DD),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}