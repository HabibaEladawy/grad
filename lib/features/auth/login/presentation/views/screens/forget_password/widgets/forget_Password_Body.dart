import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/widgets/custom_Phone%20Field.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/widgets/forget_Password_Image.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/widgets/forget_Password_Texts.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ForgetPasswordBody extends StatelessWidget {
  final TextEditingController phoneController;
  final VoidCallback onNextPressed;
  final VoidCallback onPhoneFieldTap;

  const ForgetPasswordBody({
    required this.phoneController,
    required this.onNextPressed,
    required this.onPhoneFieldTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w24),
        child: Column(
          children: [
            ForgetPasswordImage(),
            SizedBox(height: AppSizes.h24),
            ForgetPasswordTexts(),
            SizedBox(height: AppSizes.h32),
            CustomPhoneField(
              label: AppLocalizations.of(context)!.phoneNumber,
              hintText: AppLocalizations.of(context)!.timer,
              controller: phoneController,
              onTap: onPhoneFieldTap,
            ),
            SizedBox(height: AppSizes.h32),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.nextButton,
              icon: Icons.arrow_forward_ios,
              onTap: onNextPressed,
            ),
            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }
}




