
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../providers/app_theme_provider.dart';


class BookCoverImage extends StatelessWidget {
  final String imageUrl;
  const BookCoverImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.radius_sm),
      child: Image.asset(
        imageUrl,
        width: 92.w,
        height: 120.h,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(isDark),
      ),
    );
  }

  Widget _placeholder(bool isDark) {
    return Container(
      width: 70.w,
      height: 90.h,
      color: isDark
          ? AppColors.bg_card_default_dark
          : AppColors.bg_card_default_light,
      child: Icon(
        Icons.book,
        color: isDark
            ? AppColors.primary_default_dark
            : AppColors.primary_default_light,
      ),
    );
  }
}