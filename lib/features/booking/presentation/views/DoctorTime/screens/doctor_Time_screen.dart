
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/custom_buttom.dart';
import '../../../../../../core/constant/homeIndicator.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../providers/app_theme_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../BookingScreen/widgets/Date_Card.dart';
import '../../BookingScreen/widgets/Doctor_Carad.dart';
import '../../BookingScreen/widgets/Experience_Card.dart';
import '../../BookingScreen/widgets/Time_Card.dart';

class DoctorTimeScreen extends StatefulWidget {
  static const String routeName = 'DoctorTimeScreen';

  const DoctorTimeScreen({super.key});

  @override
  State<DoctorTimeScreen> createState() => _DoctorTimeScreenState();
}

class _DoctorTimeScreenState extends State<DoctorTimeScreen> {
  int selectedDateIndex = -1;
  int selectedTimeIndex = -1;

  final List<Map<String, dynamic>> dateList = [
    {'number': 20, 'day': 'السبت'},
    {'number': 19, 'day': 'الجمعة'},
    {'number': 18, 'day': 'الخميس'},
    {'number': 17, 'day': 'الأربعاء'},
  ];

  final List<String> timeList = [
    '11:30 AM',
    '11:00 AM',
    '10:30 AM',
    '10:30 AM',
    '01:30 AM',
    '01:00 AM',
    '12:30 AM',
    '12:30 AM',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.r),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomButton(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.paymentMethod);
            },
            text: 'التالي',
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(AppAssets.doctor, fit: BoxFit.fill),

          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.bg_surface_default_dark
                      : AppColors.bg_surface_default_light,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.only(bottom: 80.h),
                  children: [
                    Center(child: HomeIndicator()),
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.bg_surface_default_dark
                            : AppColors.bg_surface_default_light,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Consumer<AppThemeProvider>(
                        builder: (context, appTheme, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 16.h),
                            DoctorCard(),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                ExperienceCard(
                                  textOne: '7 سنين',
                                  textTwo: 'من الخبرة',
                                  // icon: Icons.person,
                                  svgPicture: 'assets/Icons/medal_star.svg',
                                ),
                                SizedBox(width: 8.w),
                                ExperienceCard(
                                  textOne: '4.5 الف',
                                  textTwo: 'مريض',
                                  svgPicture: 'assets/Icons/people.svg',
                                ),
                                SizedBox(width: 8.w),
                                ExperienceCard(
                                  textOne: '3.5 الف',
                                  textTwo: 'تقيم',
                                  svgPicture: 'assets/Icons/ranking.svg',
                                ),
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'اختر الموعد',
                                  style: AppTextStyle.bold16TextDisplay(
                                    context,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      size: 16.r,
                                      Icons.arrow_back_ios_new_rounded,
                                      color: AppColors.icon_onLight_light,
                                    ),
                                    Text(
                                      'نوفمبر',
                                      style: AppTextStyle.bold12TextBody(
                                        context,
                                      ),
                                    ),
                                    Icon(
                                      size: 16.r,
                                      Icons.arrow_forward_ios_rounded,
                                      color: AppColors.icon_onLight_light,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(dateList.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDateIndex = index;
                                    });
                                  },
                                  child: DateCard(
                                    number: dateList[index]['number'],
                                    day: dateList[index]['day'],
                                    isSelected: selectedDateIndex == index,
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'الوقت المتاح',
                              style: AppTextStyle.bold16TextDisplay(context),
                            ),
                            SizedBox(height: 12.h),
                            Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children: List.generate(timeList.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTimeIndex = index;
                                    });
                                  },
                                  child: TimeCard(
                                    textTime: timeList[index],
                                    isSelected: selectedTimeIndex == index,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}