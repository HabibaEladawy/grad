
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_raduis.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import 'custom_stat_card.dart';

class ChildInfoCard extends StatelessWidget {
  const ChildInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return CustomFrame(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Images/home/boy_child_photo.png',
                width: 48.w,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'نوح عبدالرحمن ',
                            style: AppTextStyle.semibold16TextHeading(context),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '٣ سنوات وشهران',
                            style: AppTextStyle.medium12TextBody(context),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.h,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.primary_50_dark
                                        : AppColors.primary_50_light,
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.radius_full,
                                    ),
                                    border: Border.all(
                                      width: AppRadius.stroke_thin,
                                      color: isDark
                                          ? AppColors.primary_200_dark
                                          : AppColors.primary_200_light,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'ولد',
                                      style: AppTextStyle.medium12Primary(
                                        context,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 8.w),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.h,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.bg_success_subtle_dark
                                        : AppColors.bg_success_subtle_light,
                                    borderRadius: BorderRadius.circular(
                                      AppRadius.radius_full,
                                    ),
                                    border: Border.all(
                                      width: AppRadius.stroke_thin,
                                      color: isDark
                                          ? AppColors.success_default_dark
                                          : AppColors.success_default_light,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'مطمئن وينمو بشكل سليم',
                                      style: AppTextStyle.medium12Succes(
                                        context,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/Icons/arrow_drop_icon.svg',
                        width: 20.w,
                        height: 20.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 28.h,
            thickness: 0.5.h,
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomStatCard(
                  title: 'الطول',
                  value: '87 سم',
                  change: '+2 سم',
                  iconPath: 'assets/Icons/child_profile/ruler_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: 'الوزن',
                  value: '12.5 كجم',
                  change: '+2 كجم',
                  iconPath: 'assets/Icons/child_profile/weight_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: 'محيط الرأس',
                  value: '48 سم',
                  change: '+2 سم',
                  iconPath: 'assets/Icons/child_profile/brain_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: 'مؤشر النمو',
                  value: '98 %',
                  change: '+2',
                  iconPath: 'assets/Icons/child_profile/indicator_icon.svg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
