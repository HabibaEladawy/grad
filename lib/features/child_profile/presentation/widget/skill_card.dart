import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/core/widgets/custom_app_bar_button.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/child_profile/presentation/bottom_sheets/data_bottom_sheet.dart';
import 'package:dana/features/child_profile/data/model/skill_card_model.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SkillCard extends StatelessWidget {
  final SkillCardData data;

  const SkillCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return CustomFrame(
      width: 192.w,
      vPadding: 12.h,
      hPadding: 12.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.secondary_50_dark
                  : AppColors.secondary_50_light,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              data.iconSrc,
            colorFilter: ColorFilter.mode(
              isDark
                  ? AppColors.secondary_default_dark
                  : AppColors.secondary_default_light,
              BlendMode.srcIn,
            ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 4.h),
            child: Text(
              data.title,
              style: AppTextStyle.semibold16TextHeading(context),
            ),
          ),
          Text(data.subtitle, style: AppTextStyle.medium12TextBody(context)),

          const Spacer(),
          SizedBox(height: 12.h),

          Row(
            children: [
              Text(
                data.count,
                style: AppTextStyle.semibold16Secondary(context),
              ),
              SizedBox(width: 4.w),
              Text(
                context.l10n.skill,
                style: AppTextStyle.regular12TextBody(context),
              ),
              const Spacer(),
              CustomAppBarButton(
                width: 24.w,
                height: 24.w,
                borderColor: isDark
                    ? AppColors.secondary_50_dark
                    : AppColors.secondary_50_light,
                color: isDark
                    ? AppColors.secondary_50_dark
                    : AppColors.secondary_50_light,
                iconPadding: 4.w,
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
                    builder: (_) => DataBottomSheet(
                      title: data.bottomSheetTitle,
                      description: data.bottomSheetDescription,
                      items: data.bottomSheetItems,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
