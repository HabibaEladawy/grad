
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_raduis.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import 'custom_progress_bar.dart';

class SkillsOverviewCard extends StatelessWidget {
  const SkillsOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return CustomFrame(
      vPadding: 8.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Container(
              padding: EdgeInsets.only(
                top: 48.h,
                bottom: 38.h,
                right: 24.w,
                left: 24.w,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                borderRadius: BorderRadius.circular(AppRadius.radius_full),
              ),
              child: Container(
                padding: EdgeInsets.only(
                  top: 18.h,
                  bottom: 28.h,
                  left: 1.5.w,
                  right: 1.5.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.radius_full),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 4.w,
                      blurRadius: 24.w,
                      color: isDark
                          ? AppColors.primary_200_dark
                          : AppColors.primary_200_light,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  'assets/Icons/child_profile/child_status.svg',
                  color: isDark
                      ? AppColors.primary_default_dark
                      : AppColors.primary_default_light,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'بيكبر وبيتعلم كل يوم',
                    style: AppTextStyle.semibold16TextHeading(context),
                  ),
                  SizedBox(height: 16.h),

                  _SkillRow(label: 'حركته ونشاطه', value: 65),
                  _SkillRow(label: 'كلامه وتعبيره', value: 90),
                  _SkillRow(label: 'فهمه وإدراكه', value: 12),
                  _SkillRow(label: 'اجتماعياته ومشاعره', value: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final String label;
  final int value;

  const _SkillRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyle.regular12TextBody(context)),
            Text('$value%', style: AppTextStyle.semibold12Primary(context)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h, bottom: 8.h),
          child: CustomProgressBar(value: value),
        ),
      ],
    );
  }
}
