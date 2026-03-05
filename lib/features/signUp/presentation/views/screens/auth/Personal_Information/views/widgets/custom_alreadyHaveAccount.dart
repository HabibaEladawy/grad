import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';



class CustomAlreadyHaveAccount extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final VoidCallback? onTap;

  const CustomAlreadyHaveAccount({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textOne,
            style: AppTextStyle.regular16TextBody,
          ),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(

              textTwo,
              style: AppTextStyle.medium14PrimaryDefault.copyWith(

                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary_default_light, // لون الخط
                ),
              ),
            ),

        ],
      ),
    );
  }
}