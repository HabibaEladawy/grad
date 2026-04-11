
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/custom_buttom.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_raduis.dart';
import '../../../../core/utils/app_text_style.dart';
import '../screens/Appointments_Screen.dart';
import 'Change_Appointment_BottomSheet.dart';
import 'Rate_Doctor_BottomSheet.dart';
import 'Rebook_Cancelled_BottomSheet.dart';
import 'Rebook_Completed_BottomSheet.dart';

class AppointmentActionButtons extends StatelessWidget {
  final Appointment appointment;
  final bool isDark;
  final VoidCallback? onCancel;

  const AppointmentActionButtons({
    super.key,
    required this.appointment,
    required this.isDark,
    this.onCancel,
  });

  void _showSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => child,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (appointment.status) {
      case Status.upcoming:
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                borderRadius: AppRadius.radius_md,
                height: 36.h,
                text: 'تغير الموعد',
                onTap: () =>
                    _showSheet(context, const ChangeAppointmentBottomSheet()),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomButton(
                color: Colors.transparent,
                borderRadius: AppRadius.radius_md,
                borderColor: isDark
                    ? AppColors.border_button_outlined_dark
                    : AppColors.border_button_outlined_light,
                height: 36.h,
                text: 'إلغاء الحجز',
                textStyle: AppTextStyle.semibold16TextButtonOutlined(context),
                onTap: () => onCancel?.call(),
              ),
            ),
          ],
        );

      case Status.completed:
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                borderRadius: AppRadius.radius_md,
                height: 36.h,
                text: 'إعادة الحجز',
                onTap: () =>
                    _showSheet(context, const RebookCompletedBottomSheet()),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: CustomButton(
                color: Colors.transparent,
                borderRadius: AppRadius.radius_md,
                borderColor: isDark
                    ? AppColors.border_button_outlined_dark
                    : AppColors.border_button_outlined_light,
                height: 36.h,
                text: 'تقييم الطبيب',
                textStyle: AppTextStyle.semibold16TextButtonOutlined(context),
                onTap: () => _showSheet(context, const RateDoctorBottomSheet()),
              ),
            ),
          ],
        );

      case Status.cancelled:
        return Row(
          children: [
            Expanded(
              child: CustomButton(
                borderRadius: AppRadius.radius_md,
                height: 36.h,
                text: 'إعادة الحجز',
                onTap: () =>
                    _showSheet(context, const RebookCancelledBottomSheet()),
              ),
            ),
          ],
        );
    }
  }
}