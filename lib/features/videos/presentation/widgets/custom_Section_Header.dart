import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';

class CustomSectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;

  const CustomSectionHeader({
    super.key,
    required this.title,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<AppThemeProvider, bool>(
          (p) => p.appTheme == ThemeMode.dark,
    );

    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.circular(AppRadius.radius_sm),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          /// 🔹 Title
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.medium16TextHeading(context),
            ),
          ),

          /// 🔹 Back Button
          GestureDetector(
            onTap: onBackTap ?? () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.bg_surface_subtle_dark
                    : AppColors.bg_surface_subtle_light,
                borderRadius: BorderRadius.circular(AppRadius.radius_sm),
                border: Border.all(
                  color: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                  width: AppRadius.stroke_thin,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: isDark
                      ? AppColors.text_heading_dark
                      : AppColors.text_heading_light,
                  size: 24.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}