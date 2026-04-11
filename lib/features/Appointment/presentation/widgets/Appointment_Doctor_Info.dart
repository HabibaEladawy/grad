
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../screens/Appointments_Screen.dart';

class AppointmentDoctorInfo extends StatelessWidget {
  final Appointment appointment;
  final bool isDark;

  const AppointmentDoctorInfo({
    super.key,
    required this.appointment,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(appointment.image, width: 67.w),
        Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                appointment.doctorName,
                style: AppTextStyle.semibold16TextHeading(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'أخصائي علاج طبيعي',
                style: AppTextStyle.medium12TextBody(context),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 16.r,
                    color: isDark
                        ? AppColors.icon_onLight_dark
                        : AppColors.icon_onLight_light,
                  ),
                  Text(
                    appointment.address,
                    style: AppTextStyle.regular12TextBody(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}