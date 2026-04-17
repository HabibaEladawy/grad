
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_raduis.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../core/widgets/Custom_Text_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import '../../home/presentation/widgets/statistics_chart.dart';
import '../bottom_sheets/update_data_bottom_sheet.dart';

class GrowthCurveSection extends StatelessWidget {
  const GrowthCurveSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return CustomFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'منحنى التطور',
            style: AppTextStyle.semibold16TextHeading(context),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: StatisticsChart(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الطول
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: 12.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.secondary_default_dark
                      : AppColors.secondary_default_light,
                  borderRadius: BorderRadius.circular(AppRadius.radius_full),
                ),
              ),
              Text(
                'الطول (سم)',
                style: AppTextStyle.regular12TextBody(context),
              ),
              // محيط الرأس
              SizedBox(width: 16.w),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: 12.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.icon_onLight_dark
                      : AppColors.icon_onLight_light,
                  borderRadius: BorderRadius.circular(AppRadius.radius_full),
                ),
              ),
              Text(
                'محيط الرأس(سم)',
                style: AppTextStyle.regular12TextBody(context),
              ),
              // الوزن
              SizedBox(width: 16.w),
              Container(
                margin: EdgeInsets.only(left: 8.w),
                width: 12.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color.fromARGB(255, 63, 157, 168)
                      : AppColors.primary_default_light,
                  borderRadius: BorderRadius.circular(AppRadius.radius_full),
                ),
              ),
              Text(
                'الوزن (كجم)',
                style: AppTextStyle.regular12TextBody(context),
              ),
            ],
          ),

          SizedBox(height: 12.h),
          CustomTextFrame(
            text: '',
            vPadding: 10.h,
            hPadding: 8.w,
            backgroundColor: isDark
                ? AppColors.secondary_50_dark
                : AppColors.secondary_50_light,
            preIconSrc: 'assets/Icons/child_profile/data_icon.svg',
            sufIconSrc: 'assets/Icons/dark_arrow_back.svg',
            sufIconWidth: 20.w,
            preIconBackgroundColor: isDark
                ? AppColors.primary_50_dark
                : AppColors.primary_50_light,
            preIconColor: isDark
                ? const Color.fromARGB(255, 63, 157, 168)
                : AppColors.icon_onLight_light,
            preIconBorderRadius: AppRadius.radius_full,
            preIconPadding: 6.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تحديث البيانات',
                  style: AppTextStyle.medium12TextBody(context),
                ),
                Text(
                  'تحديث قياسات نوح',
                  style: AppTextStyle.bold12TextHeading(context),
                ),
              ],
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: isDark
                    ? AppColors.bg_surface_default_dark
                    : AppColors.bg_surface_default_light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.r),
                  ),
                ),
                builder: (_) => const UpdateDataBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }
}
