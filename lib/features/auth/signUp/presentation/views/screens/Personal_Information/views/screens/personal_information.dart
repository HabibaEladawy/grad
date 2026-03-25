

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../widgets/personal_information_body.dart';
///خلينا نتعرف عليك page=>
class PersonalInformation extends StatelessWidget {
  static const String routeName = 'PersonalInformation';
  final VoidCallback? onNext;

  const PersonalInformation({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: PersonalInformationBody(onNext: onNext),
      ),
    );
  }
}