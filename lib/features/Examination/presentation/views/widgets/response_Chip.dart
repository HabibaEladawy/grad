import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';

class ResponseChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ResponseChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    final primaryColor = isDark
        ? AppColors.primary_default_dark
        : AppColors.primary_default_light;

    final borderColor = isDark
        ? AppColors.border_card_default_dark
        : AppColors.border_card_default_light;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h), // ✅ قللنا الـ horizontal
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.radius_xs),
          border: Border.all(
            color: isSelected ? primaryColor : borderColor,
            width: 0.6,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // ✅
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Container(
              width: 14.w,
              height: 14.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? primaryColor : borderColor,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: 7.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                ),
              )
                  : null,
            ),
            SizedBox(width: 4.w), // ✅ قللنا الـ gap
            Flexible( // ✅ عشان النص ميعملش overflow
              child: Text(
                label,
                overflow: TextOverflow.ellipsis, // ✅ لو النص طويل
                style: isSelected
                    ? AppTextStyle.medium12TextButton(context)
                    : AppTextStyle.medium12TextBody(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}