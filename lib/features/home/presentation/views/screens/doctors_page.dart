import 'package:dana/core/widgets/custom_app_bar_button.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/home/widgets/doctor_card.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatelessWidget {
  DoctorsScreen({super.key});

  static const String routeName = 'DoctorsScreen';

  final List<Map<String, dynamic>> doctors = [
    {
      "name": "سالم غانم",
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.9,
    },
    {
      "name": 'زياد فرد الأمن',
      "image": "assets/Images/home/doctor2.png",
      "rate": 0.7,
    },
    {
      "name": 'التيت و الشريط',
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.5,
    },
    {
      "name": 'الهئ و المئ',
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.8,
    },
    {
      "name": "سالم غانم",
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.9,
    },
    {
      "name": 'زياد فرد الأمن',
      "image": "assets/Images/home/doctor2.png",
      "rate": 0.7,
    },
    {
      "name": 'التيت و الشريط',
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.5,
    },
    {
      "name": 'الهئ و المئ',
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.8,
    },
    {
      "name": "سالم غانم",
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.9,
    },
    {
      "name": 'زياد فرد الأمن',
      "image": "assets/Images/home/doctor2.png",
      "rate": 0.7,
    },
    {
      "name": 'التيت و الشريط',
      "image": "assets/Images/home/doctor2.png",
      "rate": 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 56.w,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.doctors,
                style: AppTextStyle.medium16TextHeading(context),
              ),
              CustomAppBarButton(
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: GridView.builder(
          itemCount: doctors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 192.w / 206.w,
          ),
          itemBuilder: (context, index) {
            final doctor = doctors[index];

            return DoctorCard(
              doctorName: doctor["name"],
              imageSrc: doctor["image"],
              rate: doctor["rate"],
            );
          },
        ),
      ),
    );
  }
}
