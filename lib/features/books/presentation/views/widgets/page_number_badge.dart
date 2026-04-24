import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';

class PageNumberBadge extends StatelessWidget {
  final int pageNumber;

  const PageNumberBadge({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final bgColor = isDark
        ? AppColors.primary_default_dark
        : AppColors.primary_default_light;

    return Container(
      width: 32.w,
      height: 32.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius:
        BorderRadius.circular(AppRadius.radius_sm),
      ),
      child: Text(
        '$pageNumber',
        style: AppTextStyle.semibold16TextHeading(context)
            .copyWith(color: Colors.white),
      ),
    );
  }
}