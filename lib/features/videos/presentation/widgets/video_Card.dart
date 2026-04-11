import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../../data/model/video_Model.dart';
import '../screens/video_details_screen.dart';

class VideoCard extends StatelessWidget {
  final VideoModel video;
  final List<VideoModel> relatedVideos;
  final double? imageWidth; // ✅ بتتحكمي في العرض من بره

  const VideoCard({
    super.key,
    required this.video,
    this.relatedVideos = const [],
    this.imageWidth, // ✅
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    final width = imageWidth ?? 142.w; // ✅ default 142 للهوم

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoDetailsScreen(
              video: video,
              relatedVideos: relatedVideos,
            ),
          ),
        );
      },
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: isRtl
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Container(
              width: width,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.radius_md),
                border: Border(
                  top: BorderSide(
                    color: isDark
                        ? AppColors.border_card_default_dark
                        : AppColors.border_card_default_light,
                    width: AppRadius.stroke_bold,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.radius_md),
                child: Image.asset(
                  video.imageUrl,
                  width: width,
                  height: 180.h,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: width,
              child: Text(
                video.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: isRtl ? TextAlign.right : TextAlign.left,
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                style: AppTextStyle.medium12TextHeading(context),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time,
                  size: 10.w,
                  color: isDark
                      ? AppColors.icon_onLight_dark
                      : AppColors.icon_onLight_light,
                ),
                SizedBox(width: 2.w),
                Text(
                  video.duration,
                  style: AppTextStyle.medium12TextBody(context).copyWith(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.text_body_dark
                        : AppColors.text_body_light,
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