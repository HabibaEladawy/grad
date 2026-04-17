import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../../domain/entity/Video_Entity.dart';
import '../screens/video_details_screen.dart';

class VideoCard extends StatelessWidget {
  final VideoEntity video;
  final List<VideoEntity> relatedVideos;
  final VoidCallback? onTap;
  final double? imageWidth;

  const VideoCard({
    super.key,
    required this.video,
    required this.relatedVideos,
    this.onTap,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select<AppThemeProvider, bool>(
          (p) => p.appTheme == ThemeMode.dark,
    );

    final width = imageWidth ?? 142.w;

    return InkWell(
      onTap: onTap ??
              () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoDetailsScreen(
                  video: video,
                  relatedVideos: relatedVideos, // ✅ الربط هنا
                ),
              ),
            );
          },
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Image
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
                child: Image.network(
                  video.cover,
                  width: width,
                  height: 180.h,
                  fit: BoxFit.cover,

                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },

                  errorBuilder: (context, error, stackTrace) =>
                  const Center(
                    child: Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),

            SizedBox(height: 8.h),

            /// 🔹 Title
            Text(
              video.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.medium12TextHeading(context),
            ),

            SizedBox(height: 4.h),

            /// 🔹 Time
            Row(
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
                  video.time,
                  style: AppTextStyle.medium12TextBody(context).copyWith(
                    fontSize: 8.sp,
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