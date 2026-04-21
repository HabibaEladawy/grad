import 'package:dana/core/utils/date_formatter.dart';
import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/vaccinations/presentation/screens/vaccine_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NextVaccineCard extends StatelessWidget {
  const NextVaccineCard({super.key});

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
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 12.w),
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.warning_subtle_light,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.r),
                  child: SvgPicture.asset(
                    'assets/Icons/notification/vaccine_icon.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.warning_default_light,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.nextVaccineTitle,
                    style: AppTextStyle.medium12WarningDefault(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Text(
                      context.l10n.mmrVaccineName,
                      style: AppTextStyle.bold12TextHeading(context),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/Icons/child_profile/clock_icon.svg',
                        width: 12.w,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        context.l10n.vaccineTimeInfo(
                          formatDate(context, DateTime(2026, 4, 15)),
                          20,
                        ),
                        style: AppTextStyle.medium8TextBody(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomButton(
            height: 36.h,
            color: Colors.transparent,
            text: context.l10n.fullVaccinationRecord,
            textStyle: AppTextStyle.semibold12TextButtonOutlined(context),
            borderColor: isDark
                ? AppColors.border_button_outlined_dark
                : AppColors.border_button_outlined_light,
            onTap: () {
              Navigator.pushNamed(context, VaccineScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
