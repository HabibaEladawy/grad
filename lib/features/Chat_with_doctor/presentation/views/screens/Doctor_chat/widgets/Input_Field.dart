import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../l10n/app_localizations.dart';
import '../../../../../../../providers/app_theme_provider.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;

  const InputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      height: 36.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 7.h,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(

        controller: controller,
        maxLines: 1,
        style: AppTextStyle.regular12TextBody(context),
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.writeMessage,
          hintStyle: AppTextStyle.regular12TextBody(context),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}