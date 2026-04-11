import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../providers/app_theme_provider.dart';
import '../../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../../../../../../../../login/presentation/cubit/sign_up_state.dart';
import '../widgets/otp_body.dart';

class OtpDialog extends StatefulWidget {
  static const String routeName = 'OtpDialog';
  final String phoneNumber;
  final VoidCallback? onVerified;

  const OtpDialog({
    super.key,
    required this.phoneNumber,
    this.onVerified,
  });

  static void show(
      BuildContext context,
      String phoneNumber, {
        VoidCallback? onVerified,
      }) {
    // نحتفظ بالـ cubit الموجود عشان نقدر نـ call verifySignUp عليه
    final signUpCubit = context.read<SignUpCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (_) => BlocProvider.value(
        value: signUpCubit,
        child: OtpDialog(
          phoneNumber: phoneNumber,
          onVerified: onVerified,
        ),
      ),
    );
  }

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  final TextEditingController _otpController = TextEditingController();
  int _remainingSeconds = 90;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 90;
      _canResend = false;
    });
    Future.delayed(const Duration(seconds: 1), _countdown);
  }

  void _countdown() {
    if (!mounted) return;
    if (_remainingSeconds > 0) {
      setState(() => _remainingSeconds--);
      Future.delayed(const Duration(seconds: 1), _countdown);
    } else {
      setState(() => _canResend = true);
    }
  }

  void _handleOtpComplete(String otp) {
    // بنبعت الـ OTP للـ API عن طريق الـ cubit
    context.read<SignUpCubit>().verifySignUp(otp: otp);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpVerified) {
          Navigator.pop(context); // اقفل الـ OTP sheet
          widget.onVerified?.call(); // روح للصفحة الجاية
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_surface_default_dark
              : AppColors.bg_surface_default_light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.radius_lg.r),
            topRight: Radius.circular(AppRadius.radius_lg.r),
          ),
        ),
        child: Column(
          children: [
            _buildDragIndicator(isDark),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: OtpBody(
                    phoneNumber: widget.phoneNumber,
                    otpController: _otpController,
                    remainingSeconds: _remainingSeconds,
                    canResend: _canResend,
                    onOtpComplete: _handleOtpComplete,
                    onResend: _startTimer,
                  ),
                ),
              ),
            ),
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
        color: isDark ? Colors.grey[600] : Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}