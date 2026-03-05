
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class HomeIndicator extends StatelessWidget {
  const HomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        margin: EdgeInsets.only(top: 14, bottom: 18),
        width: AppSizes.w134,
        height: AppSizes.h5,
        decoration: BoxDecoration(
          color: AppColors.border_card_default_light,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}