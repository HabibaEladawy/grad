
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/custom_buttom.dart';
import '../../../../core/constant/homeIndicator.dart';
import '../../../../core/widgets/custom_screen_header.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../booking/presentation/views/BookingScreen/widgets/Booking_Summary_Card.dart';
import '../../../booking/presentation/views/BookingScreen/widgets/Patient_Header_Card.dart';

class ConfirmAppointmentBottomSheet extends StatelessWidget {
  const ConfirmAppointmentBottomSheet({super.key});

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
                title: 'مراجعة الحجز',
                subtitle: 'اتأكد من التفاصيل قبل إكمال الحجز.',
              ),

              SizedBox(height: 24.h),
              BookingSummaryCard(isDark: isDark),
              SizedBox(height: 12.h),
              PatientHeaderCard(isDark: isDark),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'تأكيد الحجز',
                onTap: () {
                  Navigator.pop(context);
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