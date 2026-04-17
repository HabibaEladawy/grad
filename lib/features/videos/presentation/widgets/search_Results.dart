import 'package:dana_graduation_project/features/videos/presentation/widgets/video_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../domain/entity/Video_Entity.dart';
import 'no_Results_Widget.dart';


class SearchResults extends StatelessWidget {
  final List<VideoEntity> results;

  const SearchResults({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (results.isEmpty) {
      return const NoResultsWidget();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          Text(
            l10n.searchResults,
            style: AppTextStyle.medium16TextHeading(context),
          ),

          SizedBox(height: 12.h),

          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 192 / 230,
              ),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final current = results[index];

                return VideoCard(
                  video: current,
                  imageWidth: 192.w,

                  // optional: لو مش مهم performance
                  relatedVideos: const [],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}