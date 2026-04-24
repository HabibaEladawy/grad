import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import 'Page_Badge.dart';

class BookDivider extends StatelessWidget {
  final int pageNumber;

  const BookDivider({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final color = isDark
        ? AppColors.secondary_default_dark
        : AppColors.secondary_default_light;

    return Row(
      children: [
        Icon(Icons.circle, color: color, size: 6.w),

        Expanded(
          child: Divider(height: 1, color: color),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: PageBadge(
            pageNumber: pageNumber,
            isDark: isDark,
          ),
        ),

        Expanded(
          child: Divider(height: 1, color: color),
        ),

        Icon(Icons.circle, color: color, size: 6.w),
      ],
    );
  }
}