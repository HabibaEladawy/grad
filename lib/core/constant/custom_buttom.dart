
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
    this.textColor = AppColors.bg_card_default_light

  });

  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.radius_lg.r),
          border: Border.all(
            color: AppColors.border_button_primary_light,
            width: 0.6.w,
          ),
          color: color,

        ),
        width: double.infinity,
        height: 48.h,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  // fontFamily: FontFamilies.ibm,
                ),
              ),
              if (icon != null) ...[
                SizedBox(width: 8.w),
                Icon(icon, color: textColor, size: 18.r),
              ],
            ],
          ),
        ),
      ),
    );
  }
}