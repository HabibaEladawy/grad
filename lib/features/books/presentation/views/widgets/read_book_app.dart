
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';

class ReadBookAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ReadBookAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme ==
            ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          textDirection:
          isRtl ? TextDirection.rtl : TextDirection.ltr,
          children: [
            Text(
              l10n.readBook,
              style:
              AppTextStyle.semibold16TextHeading(context),
            ),

            const Spacer(),

            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius:
              BorderRadius.circular(AppRadius.radius_sm),
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.bg_surface_subtle_dark
                      : AppColors.bg_surface_subtle_light,
                  borderRadius: BorderRadius.circular(
                      AppRadius.radius_sm),
                  border: Border.all(
                    color: isDark
                        ? AppColors.border_card_default_dark
                        : AppColors.border_card_default_light,
                    width: AppRadius.stroke_thin,
                  ),
                ),
                child: Center(
                  child: Icon(
                    isRtl
                        ? Icons.arrow_forward_ios
                        : Icons.arrow_back_ios,
                    color: isDark
                        ? AppColors.text_heading_dark
                        : AppColors.text_heading_light,
                    size: 20.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}