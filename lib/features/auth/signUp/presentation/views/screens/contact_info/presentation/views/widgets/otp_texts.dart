
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
    final locale = AppLocalizations.of(context)!;

    return Column(

      children: [
        Text(
          locale.verificationTitle,
          style: AppTextStyle.medium20TextDisplay(context),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSizes.h8),
        Text(
          locale.verificationDescLine1(phoneNumber),
          style: AppTextStyle.regular16TextBody(context),
          textAlign: TextAlign.center,
        ),
        Text(
          locale.verificationDescLine2,
          style: AppTextStyle.regular16TextBody(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}