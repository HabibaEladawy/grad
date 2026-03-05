
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class OtpTexts extends StatelessWidget {
  final String phoneNumber;

  const OtpTexts({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.verificationTitle,
          style: AppTextStyle.medium20TextDisplay,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.h8),
        Text(
          AppLocalizations.of(context)!.verificationDescLine1(phoneNumber),
          style: AppTextStyle.regular16TextBody,
          textAlign: TextAlign.center,
        ),
        Text(
          AppLocalizations.of(context)!.verificationDescLine2,
          style: AppTextStyle.regular16TextBody,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
