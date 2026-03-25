
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';

import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/custom_alreadyHaveAccount.dart';
import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/custom_text_rich.dart';
import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/cutom_google_signUp.dart';
import '../../../../../../signUp/presentation/views/screens/contact_info/presentation/views/screens/Otp_Dialog.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
          text: AppLocalizations.of(context)!.loginButton,
          onTap: () {
            OtpDialog.show(
              context,
              '01012345678',
            );
          },
        ),
        SizedBox(height: AppSizes.h44),
        const CustomTextRich(),
        const GoogleSignUpButton(),
        CustomAlreadyHaveAccount(
          textOne: AppLocalizations.of(context)!.noAccount,
          textTwo: AppLocalizations.of(context)!.createAccount,
        ),
      ],
    );
  }
}
