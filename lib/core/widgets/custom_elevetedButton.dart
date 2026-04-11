import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
/// widget=>elevetedButton
class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isIconAtStart;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.isIconAtStart = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    bool isRTL = Directionality.of(context) == TextDirection.rtl;


    final effectiveBackgroundColor = backgroundColor ?? (isDark
        ? AppColors.primary_default_dark
        : AppColors.primary_default_light);

    final effectiveTextColor = textColor ?? (isDark
        ? AppColors.bg_card_default_dark
        : AppColors.bg_card_default_light);

    final effectiveBorderColor = borderColor ?? (isDark
        ? AppColors.border_button_primary_dark
        : AppColors.border_button_primary_light);

    return SizedBox(
      width: 392,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radius_lg.r),
            side: BorderSide(
              color: effectiveBorderColor,
              width: borderWidth ?? 0.6.w,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _buildButtonContent(isRTL, effectiveTextColor),
        ),
      ),
    );
  }

  List<Widget> _buildButtonContent(bool isRTL, Color effectiveTextColor) {
    final textWidget = Text(
      text,
      style: TextStyle(
        color: effectiveTextColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 16.sp,
      ),
    );

    if (icon == null) return [textWidget];

    final iconWidget = Icon(
      icon,
      color: effectiveTextColor,
      size: 18.r,
    );

    if (isIconAtStart) {
      return [iconWidget, SizedBox(width: 8.w), textWidget];
    }

    return [textWidget, SizedBox(width: 8.w), iconWidget];
  }
}
///لو انتي محددة isIconAtStart = true → يمشي على كلامك
//
// لو لا → يخلي الاتجاه حسب اللغة
//
// عربي → الأيقونة في البداية
//
// إنجليزي → الأيقونة في النهاية