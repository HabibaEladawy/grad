
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_raduis.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.onTap,
    this.iconSrc,
    this.width,
    this.height,
    this.borderWidth,
    this.borderRadius,
    this.iconPadding,
    this.iconColor,
    this.color,
    this.borderColor,
  });

  final VoidCallback onTap;
  final Color? color;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final double? iconPadding;
  final Color? iconColor;
  final String? iconSrc;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppRadius.radius_sm,
          ),
          border: Border.all(
            color:
            borderColor ??
                (isDark
                    ? AppColors.border_card_default_dark
                    : AppColors.border_card_default_light),
            width: borderWidth ?? AppRadius.stroke_thin,
          ),
          color:
          color ??
              (isDark
                  ? AppColors.bg_surface_subtle_dark
                  : AppColors.bg_surface_subtle_light),
        ),
        width: width ?? 40.w,
        height: height ?? 40.w,
        child: Padding(
          padding: EdgeInsets.all(iconPadding ?? 8.r),
          child: SvgPicture.asset(
            iconSrc ?? 'assets/icons/dark_arrow_back.svg',
            color:
            iconColor ??
                (isDark
                    ? AppColors.icon_onDark_dark
                    : AppColors.icon_onLight_light),
          ),
        ),
      ),
    );
  }
}