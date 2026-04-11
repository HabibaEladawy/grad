
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/custom_buttom.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_routes.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/widgets/Text_Frame.dart';
import '../../../../../../core/widgets/custom_screen_header.dart';
import '../../../../../../providers/app_theme_provider.dart';
import '../widgets/Booking_Summary_Card.dart';
import '../widgets/Patient_Header_Card.dart';

class PaymentSuccessScreen extends StatefulWidget {
  static const String routeName = 'PaymentSuccessScreen';

  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
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
              showConfirmationSheet();
            },
            text: 'تأكيد الحجز',
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 32.h, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomScreenHeader(
              title: 'مراجعة الحجز',
              subtitle: 'اتأكد من التفاصيل قبل إكمال الحجز.',
            ),
            SizedBox(height: 24.h),
            BookingSummaryCard(isDark: isDark),
            SizedBox(height: 12.h),
            PatientHeaderCard(isDark: isDark),
            SizedBox(height: 24.h),
            Text(
              'الدفع عند الزيارة',
              style: AppTextStyle.bold16TextDisplay(context),
            ),
            SizedBox(height: 12.h),

            Column(
              children: [
                TextFrame(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تكلفة الخدمة',
                            style: AppTextStyle.bold12TextHeading(context),
                          ),
                          Text(
                            '250 ج',
                            style: AppTextStyle.bold12TextHeading(context),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ضريبة',
                            style: AppTextStyle.semibold12TextBody(context),
                          ),

                          Text(
                            '0 ج',
                            style: AppTextStyle.semibold12TextBody(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                TextFrame(
                  color: isDark
                      ? AppColors.bg_button_primary_disabled_dark
                      : AppColors.bg_button_primary_disabled_light,
                  borderColor: isDark
                      ? AppColors.border_button_primary_dark
                      : AppColors.border_button_primary_light,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'إجمالي التكلفة',
                        style: AppTextStyle.bold12TextDisplay(context),
                      ),

                      Text(
                        '250 ج',
                        style: AppTextStyle.semibold12TextDisplay(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmationSheet() {
    final themeProvider = context.read<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 21.h,
            left: 24.w,
            right: 24.w,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 134.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: isDark
                        ? AppColors.border_card_default_dark
                        : AppColors.border_card_default_light,
                  ),
                ),
                SizedBox(height: 28.h),
                Image.asset(
                  width: 150.w,
                  height: 150.h,
                  'assets/Images/result page success motion design 1.png',
                ),
                Text(
                  'تم تأكيد الحجز',
                  style: AppTextStyle.bold20TextDisplay(context),
                ),
                SizedBox(height: 8.h),
                Text(
                  'حجزك اتسجّل بنجاح. الدفع هيكون في العيادة وقت الزيارة.',
                  style: AppTextStyle.bold16TextBody(context),
                ),
                SizedBox(height: 32.h),
                CustomButton(
                  text: 'تم',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.appointments,
                    );
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}