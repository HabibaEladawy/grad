import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OtpResendSection extends StatelessWidget {
  final int remainingSeconds;
  final bool canResend;
  final VoidCallback onResend;

  const OtpResendSection({
    super.key,
    required this.remainingSeconds,
    required this.canResend,
    required this.onResend,
  });

  String get _timerText {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: canResend ? onResend : null,
          child: Text(
            AppLocalizations.of(context)!.resendCode,
            style: AppTextStyle.medium16PrimaryDefault.copyWith(
              color: AppColors.primary_default_light,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary_default_light,
            ),
          ),
        ),
        SizedBox(width: AppSizes.w8),
        if (!canResend)
          Text(
            _timerText,
            style: AppTextStyle.medium12TextBody.copyWith(
              color: AppColors.text_body_light,
            ),
          ),
      ],
    );
  }
}