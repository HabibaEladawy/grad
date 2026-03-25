
import 'package:dana_graduation_project/core/constant/custom_buttom.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:dana_graduation_project/core/utils/app_text.dart';

import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../widgets/create_password_body.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const String routeName = 'CreatePasswordScreen';
  final VoidCallback? onNext;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  CreatePasswordScreen({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppRadius.radius_xl),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomButton(
            onTap: () => Navigator.pushNamed(context, LoginScreen.routeName),
            text: AppText.createAccount,
          ),
        ),
      ),
      body: SafeArea(
        child: CreatePasswordBody(
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
        ),
      ),
    );
  }
}