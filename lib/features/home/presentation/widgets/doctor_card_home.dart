import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../providers/app_theme_provider.dart';

class DoctorCardHome extends StatelessWidget {
  const DoctorCardHome({
    super.key,
    required this.imageSrc,
    required this.doctorName,
    this.rate = 0.0,
    this.width,
    this.specialty,
  });

  final String imageSrc;
  final String doctorName;
  final double rate;
  final double? width;
  final String? specialty;

  bool get _isNetworkImage =>
      imageSrc.startsWith('http://') || imageSrc.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Container(
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        borderRadius: BorderRadius.circular(AppRadius.radius_sm),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppRadius.radius_sm),
                topRight: Radius.circular(AppRadius.radius_sm),
              ),
              child: imageSrc.isEmpty
                  ? Image.asset(
                'assets/Images/home/doctor1.png',
                width: width ?? double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
              )
                  : _isNetworkImage
                  ? Image.network(
                imageSrc,
                width: width ?? double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 120.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) => Image.asset(
                  'assets/Images/home/doctor1.png',
                  width: width ?? double.infinity,
                  height: 120.h,
                  fit: BoxFit.cover,
                ),
              )
                  : Image.asset(
                imageSrc,
                width: width ?? double.infinity,
                height: 120.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'د. $doctorName',
                          style: AppTextStyle.regularSmTextBody,
                        ),
                        Text(
                          '⭐$rate',
                          style: AppTextStyle.regularSmTextBody,
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      specialty ?? 'أخصائي علاج طبيعي',
                      style: AppTextStyle.regularSmTextBody,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.doctorTime);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12.h),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.button_primary_default_dark
                              : AppColors.button_primary_default_light,
                          borderRadius: BorderRadius.circular(
                            AppRadius.radius_full,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Center(
                            child: Text(
                              'احجز الآن',
                              style: AppTextStyle.mediumSmTextButton,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}