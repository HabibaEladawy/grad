
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_raduis.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/Custom_BackButton.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../data/model/vaccine_model.dart';
import '../widgets/Dashed_Line_Painter.dart';
import '../widgets/Vaccine_Item_Widget.dart';

class VaccineScreen extends StatelessWidget {
  const VaccineScreen({super.key});

  static const String routeName = 'VaccineScreen';

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark
              ? AppColors.bg_card_default_dark
              : AppColors.bg_card_default_light,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 56.w,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'التطعيمات',
                  style: AppTextStyle.medium16TextHeading(context),
                ),
                CustomBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //تنبيه
                Padding(
                  padding: EdgeInsets.all(2.r),
                  child: CustomPaint(
                    painter: DashedRectPainter(
                      color: isDark
                          ? AppColors.primary_500_dark
                          : AppColors.primary_500_light,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.primary_50_dark
                            : AppColors.primary_50_light,
                        borderRadius: BorderRadius.circular(
                          AppRadius.radius_sm,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/Icons/vaccine/warning_icon.svg',
                                color: isDark
                                    ? AppColors.icon_onLight_dark
                                    : AppColors.icon_onLight_light,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'تنبية',
                                style: AppTextStyle.semibold16TextHeading(
                                  context,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'جدول التطعيمات الموضح هنا مطابق تماماً لأحدث الجداول الإجبارية الرسمية، عشان تتابعوا مواعيد حماية بطلنا الصغير بكل ثقة وأمان.',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.medium12TextButtonOutlined(
                              context,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //التطعيمات
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Column(
                    children: vaccines
                        .map((v) => VaccineItemWidget(item: v))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}