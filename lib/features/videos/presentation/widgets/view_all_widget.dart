import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/entity/Video_Entity.dart';
import 'no_Results_Widget.dart';
import 'video_Card.dart';

class ViewAllWidget extends StatelessWidget {
  final List<VideoEntity> videos;
  final String sectionTitle;
  final double? imageWidth;

  const ViewAllWidget({
    super.key,
    required this.videos,
    required this.sectionTitle,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (videos.isEmpty) {
      return const NoResultsWidget();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔹 Header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            sectionTitle,
            style: AppTextStyle.medium16TextHeading(context),
          ),
        ),

        SizedBox(height: 12.h),

        /// 🔹 Grid
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 192 / 230,
          ),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];

            return VideoCard(
              video: video,
              imageWidth: imageWidth ?? 192.w,

              // ❌ removed O(n²) logic
              relatedVideos: const [],
            );
          },
        ),
      ],
    );
  }
}