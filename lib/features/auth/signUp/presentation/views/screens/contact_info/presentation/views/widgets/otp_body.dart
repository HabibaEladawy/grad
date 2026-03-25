
import 'package:dana_graduation_project/core/widgets/otp_input_field.dart';
import 'package:dana_graduation_project/core/widgets/otp_resend_section.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'otp_texts.dart';

class OtpBody extends StatelessWidget {
  final String phoneNumber;
  final TextEditingController otpController;
  final int remainingSeconds;
  final bool canResend;
  final ValueChanged<String> onOtpComplete;
  final VoidCallback onResend;

  const OtpBody({
    super.key,
    required this.phoneNumber,
    required this.otpController,
    required this.remainingSeconds,
    required this.canResend,
    required this.onOtpComplete,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 717.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.all(AppSizes.w24),
          child:Column(
            children: [
              SizedBox(height: AppSizes.h8),
              OtpTexts(phoneNumber: phoneNumber),
              SizedBox(height: AppSizes.h32),
              OtpInputField(
                controller: otpController,
                onCompleted: onOtpComplete,
              ),
              SizedBox(height: AppSizes.h24),
              OtpResendSection(
                remainingSeconds: remainingSeconds,
                canResend: canResend,
                onResend: onResend,
              ),
            ],
          ),
        ),
      ),
    );
  }
}