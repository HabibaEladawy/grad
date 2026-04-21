import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_routes.dart';
import 'package:dana/core/widgets/home_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../../providers/app_theme_provider.dart';
import '../widgets/otp_body.dart';

class OtpDialog extends StatefulWidget {
  static const String routeName = 'OtpDialog';
  final String phoneNumber;
  final VoidCallback? onVerified;

  const OtpDialog({super.key, required this.phoneNumber, this.onVerified});

  static void show(
    BuildContext context,
    String phoneNumber, {
    VoidCallback? onVerified,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) =>
          OtpDialog(phoneNumber: phoneNumber, onVerified: onVerified),
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

  void _handleOtpComplete(String pin) {
    Navigator.of(context).pushNamed(AppRoutes.home);
    widget.onVerified?.call();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 340.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_surface_default_dark
              : AppColors.bg_surface_default_light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppRadius.radius_lg),
            topRight: Radius.circular(AppRadius.radius_lg),
          ),
        ),
        child: Column(
          children: [
            HomeIndicator(),
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
}
