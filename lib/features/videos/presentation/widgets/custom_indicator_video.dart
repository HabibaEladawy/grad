
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';

class CustomIndicatorVideo extends StatelessWidget {
  const CustomIndicatorVideo({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<AppThemeProvider, bool>(
          (p) => p.appTheme == ThemeMode.dark,
    );

    return Center(
      child: Container(
        width: 134.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.border_card_default_dark
              : AppColors.border_card_default_light,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}