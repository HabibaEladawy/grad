
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../ Vaccine/presentation/screens/Vaccine_Screen.dart';
import '../../../core/constant/custom_buttom.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../providers/app_theme_provider.dart';

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
                margin: EdgeInsets.only(left: 12.w),
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
                    color: AppColors.warning_default_light,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'التطعيم القادم',
                    style: AppTextStyle.medium12WarningDefault(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Text(
                      'التطعم الثلاثي الفيروسي (MMR)',
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
                        'بعد ٢٠ يوم (١٥ أبريل ٢٠٢٦)',
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
            text: 'سجل التطعيمات الكامل',
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
