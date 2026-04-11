
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../providers/app_theme_provider.dart';

class DoctorCard extends StatelessWidget {
  final String? image;
  const DoctorCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Container(
      height: 112.h,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: isDark
              ? AppColors.border_card_default_dark
              : AppColors.border_card_default_light,
          width: 0.8.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        color: isDark
                            ? AppColors.icon_onLight_dark
                            : AppColors.icon_onLight_light,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: isDark
                      ? AppColors.button_primary_default_dark
                      : AppColors.button_primary_default_light,
                  child: SvgPicture.asset(
                    'assets/Icons/messages.svg',
                    width: 22.w,
                    height: 22.h,
                    color: isDark
                        ? AppColors.icon_onDark_dark
                        : AppColors.icon_onDark_light,
                  ),
                ),
                Text('250 ج', style: AppTextStyle.bold16TextBody(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}