
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../providers/app_theme_provider.dart';

class CustomStatCard extends StatelessWidget {
  const CustomStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
    required this.iconPath,
    this.color,
  });

  final String title;
  final String iconPath;
  final String value;
  final String change;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Expanded(
      child: CustomFrame(
        hPadding: 0.w,
        vPadding: 12.w,
        color:
            color ??
            (isDark
                ? AppColors.bg_surface_subtle_dark
                : AppColors.bg_surface_subtle_light),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 16.w,
                    color: isDark
                        ? AppColors.icon_onLight_dark
                        : AppColors.icon_onLight_light,
                  ),
                  SizedBox(width: 4.w),
                  Text(title, style: AppTextStyle.medium10TextBody(context)),
                ],
              ),
            ),
            Text(value, style: AppTextStyle.semibold16TextDisplay(context)),
            Text(change, style: AppTextStyle.medium8Succes(context)),
          ],
        ),
      ),
    );
  }
}
