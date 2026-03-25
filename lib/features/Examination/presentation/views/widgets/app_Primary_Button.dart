import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';

class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const AppPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(392.w, 48.h),
        backgroundColor: isDark
            ? AppColors.primary_default_dark
            : AppColors.primary_default_light,
        foregroundColor: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppRadius.space_md,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          side: BorderSide(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            width: AppRadius.stroke_thin,
          ),
        ),
        elevation: 0,
      ),
      child: Text(
        label,
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        style: AppTextStyle.semibold16TextButton(context),
      ),
    );
  }
}