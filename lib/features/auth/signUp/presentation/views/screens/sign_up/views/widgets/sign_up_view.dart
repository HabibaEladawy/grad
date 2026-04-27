import 'package:dana/features/auth/signUp/presentation/views/screens/sign_up/views/widgets/sign_up_indicator_row.dart';
import 'package:dana/features/auth/signUp/presentation/views/screens/sign_up/views/widgets/sign_up_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';

class SignUpView extends StatelessWidget {
  final PageController controller;
  final int currentIndex;
  final Function(int) onPageChanged;
  final VoidCallback onNext;

  const SignUpView({
    super.key,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: AppSizes.h24),

            SignUpIndicatorRow(
              currentIndex: currentIndex,
            ),

            SizedBox(height: AppSizes.h16),

            Expanded(
              child: SignUpPageView(
                controller: controller,
                onPageChanged: onPageChanged,
                onNext: onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}