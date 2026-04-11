
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.color = AppColors.primary_default_light,
    this.textColor,
    this.textStyle,
    this.borderColor,
    this.borderRadius,
    this.height,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? borderColor;
  final IconData? icon;
  final double? borderRadius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height ?? 48.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            (borderRadius ?? AppRadius.radius_lg).r,
          ),
          border: Border.all(
            color: borderColor ?? AppColors.border_button_primary_light,
            width: 0.6.w,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: textColor ??
                          AppColors.bg_card_default_light,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
              ),
              if (icon != null) ...[
                SizedBox(width: 8.w),
                Icon(
                  icon,
                  color: textStyle?.color ??
                      textColor ??
                      AppColors.bg_card_default_light,
                  size: 18.r,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}