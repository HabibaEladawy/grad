import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/child_profile/presentation/widget/custom_stat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
                  margin: EdgeInsetsDirectional.only(start: 12.w),
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
                            context.formatAge(5, 2),
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
                                      context.l10n.boy,
                                      style: AppTextStyle.medium12Primary(
                                        context,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                    start: 8.w,
                                  ),
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
                                      context.l10n.growthStatusHealthy,
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
                  title: context.l10n.height,
                  value: '87 ${context.l10n.cm}',
                  change: '+2 ${context.l10n.cm}',
                  iconPath: 'assets/Icons/child_profile/ruler_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: context.l10n.weight,
                  value: '12.5 ${context.l10n.kg}',
                  change: '+2 ${context.l10n.kg}',
                  iconPath: 'assets/Icons/child_profile/weight_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: context.l10n.headCircumference,
                  value: '48 ${context.l10n.cm}',
                  change: '+2 ${context.l10n.cm}',
                  iconPath: 'assets/Icons/child_profile/brain_icon.svg',
                ),
                SizedBox(width: 8.w),
                CustomStatCard(
                  title: context.l10n.growthIndicator,
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
