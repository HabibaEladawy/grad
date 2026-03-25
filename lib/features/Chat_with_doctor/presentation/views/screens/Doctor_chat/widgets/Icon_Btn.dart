import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../providers/app_theme_provider.dart';

class IconBtn extends StatelessWidget {
  final IconData? icon;
  final String? assetIcon;
  final VoidCallback onTap;
  final double size;

  const IconBtn({
    super.key,
    this.icon,
    this.assetIcon,
    required this.onTap,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 24.w,
        height: 24.h,
        child: assetIcon != null
            ? Image.asset(
          assetIcon!,
          width: size,
          height: size,
          color: isDark
              ? AppColors.icon_onLight_dark
              : AppColors.icon_onLight_light,
        )
            : Icon(
          icon,
          size: size,
          color: isDark
              ? AppColors.icon_onLight_dark
              : AppColors.icon_onLight_light,
        ),
      ),
    );
  }
}