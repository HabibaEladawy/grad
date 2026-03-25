import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

import '../../providers/app_theme_provider.dart';
import 'app_colors.dart';
import 'app_styles.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppTextStyle {
  static TextStyle bold16TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w700,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }
  static TextStyle medium16TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return TextStyle(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }
  static TextStyle regular12TextButton(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return TextStyle(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      height: 1.35,
      letterSpacing: 0,
      color: isDark ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }
  static TextStyle regular12TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return TextStyle(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      height: 1.35,
      letterSpacing: 0,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }
  static TextStyle semibold24TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return TextStyle(
      fontSize: AppStyles.XL4_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }
  static TextStyle medium16TextBody(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }
  static TextStyle semibold2XLSuccess(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: isDark ? AppColors.success_default_dark : AppColors.success_default_light,
    );
  }


  static TextStyle medium12TextBody(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium12TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }



  static TextStyle regular16TextBody(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle semibold16TextButton(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle regular12TextBody(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium20TextDisplay(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium16PrimaryDefault(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }
  static TextStyle medium12TextDisplay(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium14PrimaryDefault(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }

  static TextStyle semibold20TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold16TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle medium16TextDisplay(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle semibold12TextHeading(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold16TextDisplay(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium16TextSuccess(BuildContext context) {

    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: AppColors.Text_Success_Default,
    );
  }

  static TextStyle medium12TextButton(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: isDark
          ? AppColors.button_primary_default_dark
          : AppColors.button_primary_default_light,
    );
  }
}