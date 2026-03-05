import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppText.doctorName, style:AppTextStyle.medium20TextDisplay),
                  SizedBox(width: 10),
                ],
              ),

              SizedBox(height: 4),
              Text('أخصائي علاج طبيعي',style: AppTextStyle.medium12TextBody),

              SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'القاهرة – مصر الجديدة',
                    style:AppTextStyle.regular12TextBody,
                  ),

                  SizedBox(width: 4),
                  Icon(Icons.location_on, size: 18, color: AppColors.primary_900_light),
                ],
              ),
            ],
          ),
        ),

        SizedBox(width: 12),

        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppAssets.imageBottomSheet,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}