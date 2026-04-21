import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../App_style/app_assets.dart';

class DoctorDetailsWidget extends StatelessWidget {
  const DoctorDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(
            AppAssets.image_bottomSheet,
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
                '${context.l10n.dr} إسلام غنيم',
                style: AppTextStyle.semibold20TextHeading(context),
              ),
              SizedBox(height: 8.h),
              Text(
                context.l10n.physiotherapist,
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
