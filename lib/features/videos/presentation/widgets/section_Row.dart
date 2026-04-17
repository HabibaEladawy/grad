import 'package:flutter/material.dart';
import '../../domain/entity/Video_Entity.dart';
import '../screens/view_all_screen.dart';
import 'section_header.dart';
import 'video_horizontal_list.dart';

class SectionRow extends StatelessWidget {
  final String title;
  final List<VideoEntity> videos;
  final VoidCallback? onViewAll;

  const SectionRow({
    super.key,
    required this.title,
    required this.videos,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: title,
          onViewAll: onViewAll ??
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ViewAllScreen(
                      sectionTitle: title,
                    ),
                  ),
                );
              },
        ),

        VideoHorizontalList(videos: videos, relatedVideos: [],),
      ],
    );
  }
}