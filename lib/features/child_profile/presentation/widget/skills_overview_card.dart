import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/child_profile/presentation/widget/skill_row.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: Container(
              padding: EdgeInsetsDirectional.only(
                top: 48.h,
                bottom: 38.h,
                end: 24.w,
                start: 24.w,
              ),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                borderRadius: BorderRadius.circular(AppRadius.radius_full),
              ),
              child: Container(
                padding: EdgeInsetsDirectional.only(
                  top: 18.h,
                  bottom: 28.h,
                  start: 1.5.w,
                  end: 1.5.w,
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
                  colorFilter: ColorFilter.mode(
                    isDark
                        ? AppColors.primary_default_dark
                        : AppColors.primary_default_light,
                    BlendMode.srcIn,
                  ),
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
                    context.l10n.childGrowthTitle,
                    style: AppTextStyle.semibold16TextHeading(context),
                  ),
                  SizedBox(height: 16.h),

                  SkillRow(label: context.l10n.skillMotor, value: 65),
                  SkillRow(label: context.l10n.skillSpeech, value: 90),
                  SkillRow(label: context.l10n.skillCognition, value: 12),
                  SkillRow(label: context.l10n.skillSocial, value: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
