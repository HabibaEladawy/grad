import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/app_theme_provider.dart';
import 'app_colors.dart';
import 'app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTextStyle {
  static bool _isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static TextStyle bold12TextButton(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle semibold12TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle bold12TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle bold16TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle bold12TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle bold12Secondary(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.secondary_500_dark : AppColors.secondary_500_light,
    );
  }

  static TextStyle bold16TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle medium16TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle regular12TextButton(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      height: 1.35,
      letterSpacing: 0,
      color: _isDark(context) ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle regular12TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      height: 1.35,
      letterSpacing: 0,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold24TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL4_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle medium16TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium10TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium12TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium12TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle regular16TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w400,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle semibold16TextButton(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle semibold16TextButtonOutlined(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context)
          ? AppColors.text_button_outlined_dark
          : AppColors.text_button_outlined_dark,
    );
  }

  static TextStyle semibold16TextButtonDisabled(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context)
          ? AppColors.text_button_disabled_dark
          : AppColors.text_button_disabled_light,
    );
  }

  static TextStyle regular8TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle regular12TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w400,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle bold12TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle bold16TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle bold20TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w700,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium20TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium16PrimaryDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }

  static TextStyle medium12TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium12Primary(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }

  static TextStyle medium8TextBody(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_body_dark : AppColors.text_body_light,
    );
  }

  static TextStyle medium8Succes(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.success_default_dark : AppColors.success_default_light,
    );
  }

  static TextStyle medium12Succes(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.success_default_dark : AppColors.success_default_light,
    );
  }

  static TextStyle medium12WarningDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.warning_default_dark : AppColors.warning_default_light,
    );
  }

  static TextStyle medium14PrimaryDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }

  static TextStyle semibold20TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold20Success(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.success_default_dark : AppColors.success_default_light,
    );
  }

  static TextStyle semibold20ErrorDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.error_default_dark : AppColors.error_default_light,
    );
  }

  static TextStyle semibold24ErrorDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL4_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.error_default_dark : AppColors.error_default_light,
    );
  }

  static TextStyle semibold16TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold16Secondary(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.secondary_default_dark : AppColors.secondary_default_light,
    );
  }

  static TextStyle medium16TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle semibold12TextHeading(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_heading_dark : AppColors.text_heading_light,
    );
  }

  static TextStyle semibold12TextButton(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle semibold12TextButtonOutlined(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context)
          ? AppColors.text_button_outlined_dark
          : AppColors.text_button_outlined_light,
    );
  }

  static TextStyle semibold12ErrorDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.error_default_dark : AppColors.error_default_light,
    );
  }

  static TextStyle semibold12Primary(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.primary_default_dark : AppColors.primary_default_light,
    );
  }

  static TextStyle semibold16TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle semibold20TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.XL2_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle semibold12TextDisplay(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w600,
      color: _isDark(context) ? AppColors.text_display_dark : AppColors.text_display_light,
    );
  }

  static TextStyle medium16TextSuccess(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: AppColors.Text_Success_Default,
    );
  }

  static TextStyle medium16ErrorDefault(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.LG_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.error_default_dark : AppColors.error_default_light,
    );
  }

  static TextStyle medium12TextButton(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context) ? AppColors.text_button_dark : AppColors.text_button_light,
    );
  }

  static TextStyle medium12TextButtonOutlined(BuildContext context) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: AppStyles.SM_Arabic,
      fontWeight: FontWeight.w500,
      color: _isDark(context)
          ? AppColors.text_button_outlined_dark
          : AppColors.text_button_outlined_light,
    );
  }
}