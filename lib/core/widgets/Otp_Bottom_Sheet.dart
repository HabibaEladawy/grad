import 'dart:async';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/core/widgets/otp_input_field.dart';
import 'package:dana_graduation_project/core/widgets/otp_resend_section.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../providers/app_theme_provider.dart';

class OtpBottomSheet extends StatefulWidget {
  final String phoneNumber;
  final ValueChanged<String>? onVerified;

  const OtpBottomSheet({
    super.key,
    required this.phoneNumber,
    this.onVerified,
  });

  static void show(BuildContext context, String phoneNumber, {ValueChanged<String>? onVerified}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => OtpBottomSheet(
        phoneNumber: phoneNumber,
        onVerified: onVerified,
      ),
    );
  }

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {
  final TextEditingController _otpController = TextEditingController();
  int _remainingSeconds = 90;
  bool _canResend = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = 90;
      _canResend = false;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        setState(() => _canResend = true);
        timer.cancel();
      }
    });
  }

  void _handleOtpComplete(String pin) {
    debugPrint('OTP entered: $pin');
    Navigator.pop(context);
    if (widget.onVerified != null) {
      widget.onVerified!(pin);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.radius_lg.r),
          topRight: Radius.circular(AppRadius.radius_lg.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDragIndicator(isDark),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildDragIndicator(bool isDark) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.h12, bottom: AppSizes.h8),
      width: 134.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.border_card_default_dark
            : AppColors.border_card_default_light,
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildBody() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w24),
        child: Column(
          children: [
            SizedBox(height: AppSizes.h8),
            _buildTitle(),
            SizedBox(height: AppSizes.h8),
            _buildDescription(),
            SizedBox(height: AppSizes.h32),
            OtpInputField(
              controller: _otpController,
              onCompleted: _handleOtpComplete,
            ),
            SizedBox(height: AppSizes.h24),
            OtpResendSection(
              remainingSeconds: _remainingSeconds,
              canResend: _canResend,
              onResend: _startTimer,
            ),
            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      AppLocalizations.of(context)!.verificationTitle,
      style: AppTextStyle.medium20TextDisplay(context),
    );
  }

  Widget _buildDescription() {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.verificationDescLine1(widget.phoneNumber),
          style: AppTextStyle.regular16TextBody(context),
          textAlign: TextAlign.center,
        ),
        Text(
          AppLocalizations.of(context)!.verificationDescLine2,
          style: AppTextStyle.regular16TextBody(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}