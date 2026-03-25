
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/screens/forget_password_page.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../providers/app_theme_provider.dart';

class LoginForgotPassword extends StatelessWidget {
  const LoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return TextButton(
      onPressed: () => ForgetPasswordDialog.show(context),
      child: Text(
        AppLocalizations.of(context)!.forgotPassword,
        style: AppTextStyle.medium16PrimaryDefault(context).copyWith(
          decoration: TextDecoration.underline,
          decorationColor: isDark
              ? AppColors.primary_default_dark
              : AppColors.primary_default_light,
        ),
      ),
    );
  }
}