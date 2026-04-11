import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../screens/search_Screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    this.onSearchTap,
    this.title,
    this.searchType = SearchType.videos,
  });
  final VoidCallback? onSearchTap;
  final String? title;
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

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
                  isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                  color: isDark
                      ? AppColors.text_heading_dark
                      : AppColors.text_heading_light,
                  size: 24.w,
                ),
              ),
            ),
          ),


          if (title != null)
            Text(title!, style: AppTextStyle.medium16TextHeading(context)),


          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => SearchScreen(searchType: searchType),
              );
            },
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
                child: ImageIcon(
                  AssetImage(AppAssets.search_normal),
                  color: isDark
                      ? AppColors.text_heading_dark
                      : AppColors.text_heading_light,
                  size: 24.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}