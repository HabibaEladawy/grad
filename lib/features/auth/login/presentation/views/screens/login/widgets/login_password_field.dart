
import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomTextForm(
        text: AppLocalizations.of(context)!.passwordLabel,
        hintText: AppLocalizations.of(context)!.passwordHint,
        icon: Icons.visibility_outlined,
      ),
    );
  }
}