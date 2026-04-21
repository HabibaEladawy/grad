import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/core/utils/date_formatter.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/booking/presentation/views/BookingScreen/widgets/doctor_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingSummaryCard extends StatelessWidget {
  const BookingSummaryCard({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        border: BoxBorder.all(
          color: isDark
              ? AppColors.border_card_default_dark
              : AppColors.border_card_default_light,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DoctorDetailsWidget(),
          Divider(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            thickness: 1,
            radius: BorderRadius.circular(8.r),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.date,
                      style: AppTextStyle.semibold12TextHeading(context),
                    ),
                    Text(
                      formatDate(context, DateTime(2026, 1, 2)),
                      style: AppTextStyle.bold12TextBody(context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.time,
                      style: AppTextStyle.semibold12TextHeading(context),
                    ),
                    Text(
                      formatSingleTime(context, TimeOfDay(hour: 11, minute: 0)),
                      style: AppTextStyle.bold12TextBody(context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.l10n.bookingNumber,
                      style: AppTextStyle.semibold12TextHeading(context),
                    ),
                    Text(
                      '#594894',
                      style: AppTextStyle.bold12TextBody(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
