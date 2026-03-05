
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/screens/forget_password_page.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';


class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => ForgetPasswordDialog.show(context),
      child: Text(
        AppLocalizations.of(context)!.forgotPassword,
        style: AppTextStyle.medium16PrimaryDefault.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primary_default_light,
        ),
      ),
    );
  }
}