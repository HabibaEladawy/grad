
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewBookingBottomButton extends StatelessWidget {
  final VoidCallback onTap;
  const ReviewBookingBottomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary_default_light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          ),
          minimumSize: const Size(double.infinity, 52),
        ),
        child: Text(
          'تأكيد الحجز',
          style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}