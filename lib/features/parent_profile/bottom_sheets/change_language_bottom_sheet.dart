
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Text_Frame.dart';
import '../../../providers/app_theme_provider.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  State<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  int selectedLanguage = 0;

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
                'لغة التطبيق',
                style: AppTextStyle.medium20TextDisplay(context),
              ),

              SizedBox(height: 8.h),

              Text(
                'اختار اللغة اللي تريحك وتخلي متابعة صحة أولادك أسهل عليك.',
                style: AppTextStyle.regular16TextBody(context),
              ),

              SizedBox(height: 24.h),

              CustomTextFrame(
                text: 'اللغة العربية',
                isSelectable: true,
                isSelected: selectedLanguage == 0,
                preIconSrc: 'assets/icons/profile/arabic_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
                onTap: () {
                  setState(() {
                    selectedLanguage = 0;
                  });
                },
              ),

              SizedBox(height: 12.h),

              CustomTextFrame(
                text: 'اللغة الإنجليزية',
                isSelectable: true,
                isSelected: selectedLanguage == 1,
                preIconSrc: 'assets/icons/profile/english_icon.svg',
                preIconBackgroundColor: isDark
                    ? AppColors.primary_50_dark
                    : AppColors.primary_50_light,
                preIconColor: isDark
                    ? const Color.fromARGB(255, 63, 157, 168)
                    : AppColors.icon_onLight_light,
                onTap: () {
                  setState(() {
                    selectedLanguage = 1;
                  });
                },
              ),

              SizedBox(height: 167.h),
            ],
          ),
        ),
      ),
    );
  }
}
