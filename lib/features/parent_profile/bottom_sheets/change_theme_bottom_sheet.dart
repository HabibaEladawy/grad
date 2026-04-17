
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Text_Frame.dart';
import '../../../providers/app_theme_provider.dart';

class ChangeThemeBottomSheet extends StatefulWidget {
  const ChangeThemeBottomSheet({super.key});

  @override
  State<ChangeThemeBottomSheet> createState() => _ChangeThemeBottomSheetState();
}

class _ChangeThemeBottomSheetState extends State<ChangeThemeBottomSheet> {
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
                'مظهر التطبيق',
                style: AppTextStyle.medium20TextDisplay(context),
              ),

              SizedBox(height: 8.h),

              Text(
                'عشان راحتك وراحة عينك، اختار الشكل اللي تفضله.',
                style: AppTextStyle.regular16TextBody(context),
              ),

              SizedBox(height: 24.h),

              CustomTextFrame(
                text: 'الوضع الفاتح (نهاري)',
                preIconSrc: 'assets/icons/profile/theme_light_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
                isSelectable: true,
                isSelected: themeProvider.appTheme == ThemeMode.light,
                onTap: () {
                  context.read<AppThemeProvider>().changeTheme(ThemeMode.light);
                },
              ),

              SizedBox(height: 12.h),

              CustomTextFrame(
                text: 'الوضع الغامق (ليلي)',
                preIconSrc: 'assets/icons/profile/theme_dark_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
                isSelectable: true,
                isSelected: themeProvider.appTheme == ThemeMode.dark,
                onTap: () {
                  context.read<AppThemeProvider>().changeTheme(ThemeMode.dark);
                },
              ),

              SizedBox(height: 12.h),

              CustomTextFrame(
                text: 'نفس إعدادات الموبايل',
                preIconSrc: 'assets/icons/profile/system_theme_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
                isSelectable: true,
                isSelected: themeProvider.appTheme == ThemeMode.system,
                onTap: () {
                  context.read<AppThemeProvider>().changeTheme(
                    ThemeMode.system,
                  );
                },
              ),

              SizedBox(height: 91.h),
            ],
          ),
        ),
      ),
    );
  }
}
