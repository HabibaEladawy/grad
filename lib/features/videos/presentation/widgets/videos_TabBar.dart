import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';


class VideosTabBar extends StatelessWidget {
  final String activeTab;
  final void Function(String) onTabChanged;

  const VideosTabBar({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final l10n = AppLocalizations.of(context)!;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    final tabs = [
      {'key': 'examination', 'icon': 'assets/Images/icon_examination.png', 'label': l10n.examination},

      {'key': 'videos', 'icon': 'assets/Images/icon_videos.png', 'label': l10n.videos},
      {'key': 'books', 'icon': 'assets/Images/icon_book.png', 'label': l10n.books},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isActive = activeTab == tab['label'];
          final isLast = index == tabs.length - 1;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: isRtl ? (isLast ? 0 : 8.w) : 0,
                right: isRtl ? 0 : (isLast ? 0 : 8.w),
              ),
              child: GestureDetector(
                onTap: () {
                  onTabChanged(tab['label'] as String);
                  switch (tab['key']) {
                    case 'books':
                      Navigator.pushReplacementNamed(context, AppRoutes.books);
                      break;
                    case 'videos':
                      Navigator.pushReplacementNamed(context, AppRoutes.videos);
                      break;
                    case 'examination':
                      Navigator.pushReplacementNamed(context, AppRoutes.examination);
                      break;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: isActive
                        ? isDark ? AppColors.primary_50_dark : AppColors.primary_50_light
                        : isDark ? AppColors.bg_card_default_dark : AppColors.bg_card_default_light,
                    border: Border.all(
                      width: 0.6,
                      color: isActive
                          ? isDark ? AppColors.primary_default_dark : AppColors.primary_default_light
                          : isDark ? AppColors.border_card_default_dark : AppColors.border_card_default_light,
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.radius_sm),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        tab['icon'] as String,
                        width: 16.w,
                        height: 16.h,
                        color: isActive
                            ? isDark ? AppColors.primary_default_dark : AppColors.primary_default_light
                            : isDark ? AppColors.icon_onLight_dark : AppColors.icon_onLight_light,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        tab['label'] as String,
                        style: isActive
                            ? AppTextStyle.medium12TextButton(context)
                            : AppTextStyle.medium12TextBody(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}