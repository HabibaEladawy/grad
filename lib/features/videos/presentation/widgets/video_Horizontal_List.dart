import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/Video_Entity.dart';
import 'video_card.dart';

class VideoHorizontalList extends StatelessWidget {
  final List<VideoEntity> videos;
  final List<VideoEntity> relatedVideos;

  const VideoHorizontalList({
    super.key,
    required this.videos,
    required this.relatedVideos,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemCount: videos.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final video = videos[index];
          return VideoCard(
            video: video,
            relatedVideos: relatedVideos
                .where((v) => v.id != video.id)
                .toList(),
          );
        },
      ),
    );
  }
}