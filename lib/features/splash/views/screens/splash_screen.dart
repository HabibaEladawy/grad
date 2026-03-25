import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/features/splash/views/widgets/splash_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: const Center(child: SplashAnimationWidget()),
    );
  }
}