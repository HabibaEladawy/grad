import 'package:dana/core/widgets/password_field.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:dana/core/utils/app_sizes.dart';
import 'package:dana/l10n/app_localizations.dart';

class NewPasswordFields extends StatelessWidget {
  const NewPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.newPasswordLabel,
          style: AppTextStyle.medium12TextHeading(context),
        ),
        SizedBox(height: AppSizes.h8),
        PasswordField(text: AppLocalizations.of(context)!.newPasswordHint),
        SizedBox(height: AppSizes.h16),
        Text(
          AppLocalizations.of(context)!.confirmPasswordLabel,
          style: AppTextStyle.medium12TextHeading(context),
        ),
        SizedBox(height: AppSizes.h8),
        PasswordField(text: AppLocalizations.of(context)!.confirmPasswordHint),
      ],
    );
  }
}
