import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../domain/entity/Video_Entity.dart';



class VideoInfoWidget extends StatelessWidget {
  final VideoEntity video;

  const VideoInfoWidget({
    super.key,
    required this.video,
  });

  String formatViews(int? views) {
    final value = views ?? 125908;
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<AppThemeProvider, bool>(
          (p) => p.appTheme == ThemeMode.dark,
    );

    final l10n = AppLocalizations.of(context)!;
    final views = formatViews(video.views);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_card_default_dark
              : AppColors.bg_card_default_light,
          borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          border: Border(
            top: BorderSide(
              color: isDark
                  ? AppColors.border_card_default_dark
                  : AppColors.border_card_default_light,
              width: AppRadius.stroke_thin,
            ),
          ),
        ),
        padding: EdgeInsets.all(AppRadius.space_lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Title
            Text(
              video.title,
              style: AppTextStyle.semibold24TextHeading(context),
            ),

            SizedBox(height: AppRadius.space_md),

            /// 🔹 Description
            Text(
              video.description ?? l10n.noDescription,
              style: AppTextStyle.medium12TextBody(context),
            ),

            SizedBox(height: AppRadius.space_md),

            /// 🔹 Views
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  size: 14.w,
                  color: isDark
                      ? AppColors.text_button_disabled_dark
                      : AppColors.text_button_disabled_light,
                ),
                SizedBox(width: 4.w),
                Text(
                  '${l10n.views} $views',
                  style: AppTextStyle.regular12TextBody(context).copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}