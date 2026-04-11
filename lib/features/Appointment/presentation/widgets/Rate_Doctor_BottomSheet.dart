
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/custom_buttom.dart';
import '../../../../core/constant/homeIndicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/Custom_Frame.dart';
import '../../../../core/widgets/custom_screen_header.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../../booking/presentation/views/BookingScreen/widgets/Doctor-Details_Widget.dart';
import 'Rate_Card.dart';

class RateDoctorBottomSheet extends StatefulWidget {
  const RateDoctorBottomSheet({super.key});

  @override
  State<RateDoctorBottomSheet> createState() => _RateDoctorBottomSheetState();
}

class _RateDoctorBottomSheetState extends State<RateDoctorBottomSheet> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    final isButtonEnabled = rating > 0;

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
                title: 'طمنا.. أخبار استشارتكم إيه؟',
                subtitle:
                'نريد رأيك في تجربتك مع دكتور إسلام غنيم. تقييمك يساعدنا في تحسين الرعاية.',
              ),
              SizedBox(height: 24.h),
              CustomFrame(vPadding: 12.h, child: DoctorDetailsWidget()),
              SizedBox(height: 12.h),
              RateCard(
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
              SizedBox(height: 40.h),
              CustomButton(
                color: isButtonEnabled
                    ? (isDark
                    ? AppColors.button_primary_default_dark
                    : AppColors.button_primary_default_light)
                    : (isDark
                    ? AppColors.bg_button_primary_disabled_dark
                    : AppColors.bg_button_primary_disabled_light),
                text: 'إرسال التقييم',
                textColor: isButtonEnabled
                    ? (isDark
                    ? AppColors.text_button_dark
                    : AppColors.text_button_light)
                    : (isDark
                    ? AppColors.text_button_disabled_dark
                    : AppColors.text_button_disabled_light),
                borderColor: isButtonEnabled
                    ? (isDark
                    ? AppColors.border_button_primary_dark
                    : AppColors.border_button_primary_light)
                    : (isDark
                    ? AppColors.bg_button_primary_disabled_dark
                    : AppColors.bg_button_primary_disabled_light),
                onTap: isButtonEnabled
                    ? () {
                  Navigator.pop(context);
                }
                    : () {},
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}