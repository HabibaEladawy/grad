
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Text_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import 'change_password_bottom_sheet.dart';
import 'edit_profile_bottom_sheet.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

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
              Text(
                'إعدادات الحساب',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'ساعدنا نخلي بياناتك دايماً دقيقة ومحمية. حدد الإجراء اللي عايزة.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 24.h),
              // تغيير البيانات الشخصيه
              CustomTextFrame(
                text: 'تغير بيانات الملف الشخصي',
                height: 64.h,
                width: double.infinity,
                bottomMargin: 12.h,
                preIconSrc: 'assets/icons/profile/profile_icon.svg',
                sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
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
                    builder: (_) => EditProfileBottomSheet(),
                  );
                },
              ),
              // كلمه السر
              CustomTextFrame(
                text: 'تغير الرقم السري',
                height: 64.h,
                width: double.infinity,
                bottomMargin: 150.h,
                preIconSrc: 'assets/icons/profile/password_icon.svg',
                sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
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
                    builder: (_) => ChangePasswordBottomSheet(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
