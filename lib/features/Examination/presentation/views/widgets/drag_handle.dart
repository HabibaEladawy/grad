import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/app_theme_provider.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return SizedBox(
      width: double.infinity,
      height: 24.h,
      child: Center(
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
      ),
    );
  }
}