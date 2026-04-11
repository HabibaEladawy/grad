
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_raduis.dart';
import '../../../../core/utils/app_text_style.dart';
import '../screens/Appointments_Screen.dart';

class AppointmentDateTimeHeader extends StatelessWidget {
  final Appointment appointment;
  final bool isDark;

  const AppointmentDateTimeHeader({
    super.key,
    required this.appointment,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final isCancelled = appointment.status == Status.cancelled;

    final color = isCancelled
        ? (isDark
        ? AppColors.error_default_dark
        : AppColors.error_default_light)
        : (isDark
        ? AppColors.primary_default_dark
        : AppColors.primary_default_light);

    final bgColor = isCancelled
        ? (isDark ? AppColors.error_subtle_dark : AppColors.error_subtle_light)
        : (isDark ? AppColors.primary_50_dark : AppColors.primary_50_light);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: color, width: AppRadius.stroke_thin),
        borderRadius: BorderRadius.circular(AppRadius.radius_sm),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icons/calendar_icon.svg',
                  color: isDark
                      ? AppColors.icon_onLight_dark
                      : AppColors.icon_onLight_light,
                ),
                SizedBox(width: 4.w),
                Text(
                  appointment.date,
                  style: AppTextStyle.medium12TextHeading(context),
                ),
              ],
            ),
          ),
          Container(height: 23.h, width: 1.w, color: color),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Icons/appointments/clock_icon.svg',
                  color: isDark
                      ? AppColors.icon_onLight_dark
                      : AppColors.icon_onLight_light,
                ),
                SizedBox(width: 4.w),
                Text(
                  appointment.time,
                  style: AppTextStyle.medium12TextHeading(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}