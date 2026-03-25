
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../providers/app_theme_provider.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: Padding(
        padding: const EdgeInsets.only(top: 34.5, right: 24, left: 24),
        child: LoginBody(),
      ),
    );
  }
}