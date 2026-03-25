import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';


class ExaminationHeader extends StatelessWidget {
  const ExaminationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      width: 440.w,
      height: 56.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l10n.examinationTitle,
            style: AppTextStyle.semibold16TextHeading(context),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.bg_surface_subtle_dark
                    : AppColors.bg_surface_subtle_light,
                borderRadius: BorderRadius.circular(AppRadius.radius_sm),
                border: Border.all(
                  color: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                  width: AppRadius.stroke_thin,
                ),
              ),
              child: Center(
                child: Icon(
                  isRtl ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: isDark
                      ? AppColors.text_heading_dark
                      : AppColors.text_heading_light,
                  size: 24.w,
                ),
              ),
            ),
          ),        ],
      ),
    );
  }
}