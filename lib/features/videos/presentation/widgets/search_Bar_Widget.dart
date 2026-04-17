import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<AppThemeProvider, bool>(
          (p) => p.appTheme == ThemeMode.dark,
    );

    final l10n = AppLocalizations.of(context)!;

    final borderRadius = BorderRadius.circular(AppRadius.radius_sm);

    InputBorder buildBorder(Color color) => OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(color: color, width: 1.5),
    );

    final borderColor = isDark
        ? AppColors.border_card_default_dark
        : AppColors.border_card_default_light;

    final focusColor = isDark
        ? AppColors.primary_default_dark
        : AppColors.primary_default_light;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        style: AppTextStyle.regular12TextBody(context),

        decoration: InputDecoration(
          hintText: l10n.searchVideos,
          hintStyle: AppTextStyle.regular12TextBody(context),

          prefixIcon: Padding(
            padding: EdgeInsets.all(12.w),
            child: ImageIcon(
              AssetImage(AppAssets.search_normal),
              color: isDark
                  ? AppColors.icon_onLight_dark
                  : AppColors.icon_onLight_light,
              size: 24.w,
            ),
          ),

          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 10.h,
          ),

          border: buildBorder(borderColor),
          enabledBorder: buildBorder(borderColor),
          focusedBorder: buildBorder(focusColor),
        ),
      ),
    );
  }
}