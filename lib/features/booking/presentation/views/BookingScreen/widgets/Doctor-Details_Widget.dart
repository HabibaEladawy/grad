
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            AppAssets.imageBottomSheet,
            height: 70.h,
            width: 70.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'د.إسلام غنيم',
                style: AppTextStyle.semibold20TextHeading(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'أخصائي علاج طبيعي',
                style: AppTextStyle.bold12TextBody(context),
              ),

              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.icon_onLight_light,
                    size: 16.r,
                  ),
                  Text(
                    'القاهرة – مصر الجديدة',
                    style: AppTextStyle.bold12TextBody(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}