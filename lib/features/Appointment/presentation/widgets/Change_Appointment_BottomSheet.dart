
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/custom_buttom.dart';
import '../../../../core/constant/homeIndicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_screen_header.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../booking/presentation/views/BookingScreen/widgets/Date_Card.dart';
import '../../../booking/presentation/views/BookingScreen/widgets/Time_Card.dart';
import 'Confirm_Appointment_BottomSheet.dart';

class ChangeAppointmentBottomSheet extends StatefulWidget {
  const ChangeAppointmentBottomSheet({super.key});

  @override
  State<ChangeAppointmentBottomSheet> createState() =>
      _ChangeAppointmentBottomSheetState();
}

class _ChangeAppointmentBottomSheetState
    extends State<ChangeAppointmentBottomSheet> {
  int selectedDateIndex = -1;
  int selectedTimeIndex = -1;

  final List<Map<String, dynamic>> dateList = [
    {'number': 17, 'day': 'الأربعاء'},
    {'number': 18, 'day': 'الخميس'},
    {'number': 19, 'day': 'الجمعة'},
    {'number': 20, 'day': 'السبت'},
  ];

  final List<String> timeList = [
    '10:30 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:30 AM',
    '12:30 AM',
    '01:00 AM',
    '01:30 AM',
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: HomeIndicator()),
              SizedBox(height: 20.h),
              CustomScreenHeader(
                title: 'نكمل المشوار من تاني؟',
                subtitle:
                'الرحلة على طفلك مستمرة. حدد وقت يناسبك لتكملوا خطوتكم.',
              ),

              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اختر الموعد',
                    style: AppTextStyle.bold16TextDisplay(context),
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 16.r,
                        Icons.arrow_back_ios_new_rounded,
                        color: isDark
                            ? AppColors.icon_onLight_dark
                            : AppColors.icon_onLight_light,
                      ),
                      Text(
                        'نوفمبر',
                        style: AppTextStyle.bold12TextBody(context),
                      ),
                      Icon(
                        size: 16.r,
                        Icons.arrow_forward_ios_rounded,
                        color: isDark
                            ? AppColors.icon_onLight_dark
                            : AppColors.icon_onLight_light,
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
              SizedBox(height: 40.h),
              CustomButton(
                text: 'اختيار ميعاد جديد',
                onTap: () {
                  Navigator.pop(context);
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
                    builder: (_) => const ConfirmAppointmentBottomSheet(),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}