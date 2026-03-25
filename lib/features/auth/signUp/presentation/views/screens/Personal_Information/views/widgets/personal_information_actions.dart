
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'custom_alreadyHaveAccount.dart';
import 'custom_text_rich.dart';
import 'cutom_google_signUp.dart';

class PersonalInformationActions extends StatelessWidget {
  final VoidCallback? onNext;

  const PersonalInformationActions({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          onTap: onNext,
          text: AppLocalizations.of(context)!.next,
          icon: Icons.arrow_forward_ios,
        ),
        SizedBox(height: AppSizes.h44),
        const CustomTextRich(),
        const GoogleSignUpButton(),
        CustomAlreadyHaveAccount(
          textOne: AppLocalizations.of(context)!.alreadyHaveAccount,
          textTwo: AppLocalizations.of(context)!.signIn,
        ),
      ],
    );
  }
}
