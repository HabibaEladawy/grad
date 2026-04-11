import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';

class CustomAlreadyHaveAccount extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final VoidCallback? onTap;

  const CustomAlreadyHaveAccount({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textOne,
            style: AppTextStyle.regular16TextBody(context),
          ),
          TextButton(
            onPressed: onTap ?? () => Navigator.pushReplacementNamed(context, AppRoutes.login),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              textTwo,
              style: AppTextStyle.medium14PrimaryDefault(context).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: isDark
                    ? AppColors.primary_default_dark
                    : AppColors.primary_default_light,
              ),
            ),
          ),
        ],
      ),
    );
  }
}