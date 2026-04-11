
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/screens/payment_Add_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/constant/custom_buttom.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/widgets/Text_Frame.dart';
import '../../../../../../core/widgets/custom_screen_header.dart';
import '../../../../../../providers/app_theme_provider.dart';
import '../../BookingScreen/widgets/Doctor-Details_Widget.dart';

class OnlinePaymentScreen extends StatefulWidget {
  static const String routeName = 'OnlinePaymentScreen';

  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<OnlinePaymentScreen> {
  String selected = 'تكلفة الخدمة';

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
              Navigator.pushNamed(context, PaymentAddScreen.routeName);
            },
            text: 'استمرار للدفع',
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
            Container(
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

                  width: 0.6.w,
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
                    thickness: 1.h,
                    radius: BorderRadius.circular(8.r),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'التاريخ',
                                style: AppTextStyle.semibold12TextHeading(
                                  context,
                                ),
                              ),
                              Text(
                                'الخميس 18 نوفمبر',
                                style: AppTextStyle.bold12TextBody(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'الوقت',
                                style: AppTextStyle.semibold12TextHeading(
                                  context,
                                ),
                              ),
                              Text(
                                '10:00 ص',
                                style: AppTextStyle.bold12TextBody(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 115.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'رقم الحجز',
                                style: AppTextStyle.semibold12TextHeading(
                                  context,
                                ),
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
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Container(
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
                  width: 0.6.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'نوح عبدالرحمن ',
                        style: AppTextStyle.semibold20TextHeading(context),
                      ),
                      Text(
                        ' (كشف)',
                        style: AppTextStyle.bold12TextBody(context),
                      ),
                    ],
                  ),
                  Text('8 سنوات', style: AppTextStyle.bold12TextBody(context)),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'الدفع الإلكتروني',
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
}