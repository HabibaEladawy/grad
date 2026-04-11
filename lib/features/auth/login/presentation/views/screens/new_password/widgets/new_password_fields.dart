import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class NewPasswordFields extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const NewPasswordFields({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          text: AppLocalizations.of(context)!.newPasswordLabel,
          hintText: AppLocalizations.of(context)!.newPasswordHint,
          icon: Icons.visibility_outlined,
          controller: passwordController,
        ),
        SizedBox(height: AppSizes.h16),
        CustomTextForm(
          text: AppLocalizations.of(context)!.confirmPasswordButton,
          hintText: AppLocalizations.of(context)!.newPasswordHint,
          icon: Icons.visibility_outlined,
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}