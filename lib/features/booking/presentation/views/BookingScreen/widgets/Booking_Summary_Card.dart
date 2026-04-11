
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';
import 'Doctor-Details_Widget.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        border: BoxBorder.all(
          color: isDark
              ? AppColors.border_card_default_dark
              : AppColors.border_card_default_light,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DoctorDetailsWidget(),
          Divider(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            thickness: 1,
            radius: BorderRadius.circular(8.r),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'التاريخ',
                        style: AppTextStyle.semibold12TextHeading(context),
                      ),
                      Text(
                        'الخميس 18 نوفمبر',
                        style: AppTextStyle.bold12TextBody(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'الوقت',
                        style: AppTextStyle.semibold12TextHeading(context),
                      ),
                      Text(
                        '10:00 ص',
                        style: AppTextStyle.bold12TextBody(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 115.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'رقم الحجز',
                        style: AppTextStyle.semibold12TextHeading(context),
                      ),
                      Text(
                        '#594894',
                        style: AppTextStyle.bold12TextBody(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}