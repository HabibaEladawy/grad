
import 'package:dana_graduation_project/core/widgets/custom_Phone%20Field.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class LoginPhoneField extends StatelessWidget {
  const LoginPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPhoneField(
      label: AppLocalizations.of(context)!.phoneNumber,
      hintText: AppLocalizations.of(context)!.timer,
    );
  }
}