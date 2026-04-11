
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return IntlPhoneField(
      initialCountryCode: 'EG',
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            width: 0.8.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            width: 0.8.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 213, 44, 44),
            width: 0.8.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 213, 44, 44),
            width: 0.8.w,
          ),
        ),
        contentPadding: EdgeInsets.only(top: 29.h, right: 108.w),
      ),
      style: AppTextStyle.medium16TextBody(context),
      flagsButtonMargin: EdgeInsets.symmetric(vertical: 9.h),
      flagsButtonPadding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
      dropdownDecoration: BoxDecoration(
        color: isDark
            ? AppColors.border_card_default_dark
            : AppColors.border_card_default_light,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
      ),
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        searchFieldInputDecoration: InputDecoration(
          hintText: 'ابحث عن الدولة',
          hintStyle: TextStyle(
            fontFamily: 'IBMPlexSansArabic',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.text_body_light,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.r),
            borderSide: BorderSide(
              color: isDark
                  ? AppColors.border_card_default_dark
                  : AppColors.border_card_default_light,
            ),
          ),
          fillColor: AppColors.bg_surface_default_light,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22.r),
            borderSide: BorderSide(
              color: isDark
                  ? AppColors.primary_default_dark
                  : AppColors.primary_default_light,
            ),
          ),
        ),
        searchFieldCursorColor: isDark
            ? AppColors.primary_default_dark
            : AppColors.primary_default_light,
        countryNameStyle: AppTextStyle.medium16TextBody(context),
        countryCodeStyle: AppTextStyle.medium16TextBody(context),
      ),
      dropdownTextStyle: AppTextStyle.medium16TextBody(context),
    );
  }
}