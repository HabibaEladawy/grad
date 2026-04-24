import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../providers/app_theme_provider.dart';
import 'app_bar_back_button.dart';
import 'appbar_search_button.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.onSearchTap,
    this.title,
  });

  final VoidCallback? onSearchTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl =
        Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      width: 440.w,
      height: 56.h,
      padding: EdgeInsets.symmetric(
        horizontal: AppRadius.space_xl,
        vertical: AppRadius.space_sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        children: [
          AppBarSearchButton(
            isDark: isDark,
            onTap: onSearchTap,
          ),

          if (title != null)
            Expanded(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.medium16TextHeading(context),
              ),
            ),

          AppBarBackButton(
            isDark: isDark,
            isRtl: isRtl,
          ),
        ],
      ),
    );
  }
}