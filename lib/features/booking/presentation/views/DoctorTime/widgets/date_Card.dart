import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';

import 'package:flutter/material.dart';
///done
class DateCard extends StatelessWidget {
  final int number;
  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  const DateCard({
    super.key,
    required this.number,
    required this.day,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 90,
        height: 61,
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radius_sm),
          ),
          elevation: 2,

          color: isSelected ? AppColors.primary_default_light :AppColors.bg_card_default_light,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: AppTextStyle.semibold16TextHeading.copyWith(
                  color: isSelected ? Colors.white : null,
                ),
              ),
              SizedBox(height: AppSizes.h4),
              Text(
                day,
                style: AppTextStyle.medium12TextBody.copyWith(
                  color: isSelected ? Colors.white : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}