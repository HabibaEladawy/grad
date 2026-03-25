import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../data/model/video_Model.dart';
import 'video_Card.dart';

class ViewAllWidget extends StatelessWidget {
  final List<VideoModel> videos;
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
    final l10n = AppLocalizations.of(context)!;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Column(
      crossAxisAlignment:
      isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.heroGrowthJourney,
                style: AppTextStyle.medium16TextHeading(context),
              ),
              Text(
                l10n.viewAll,
                style: AppTextStyle.regular12TextBody(context),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 192 / 230, // ✅ قللنا من 260 لـ 230
          ),
          itemCount: videos.length,
          itemBuilder: (context, index) => VideoCard(
            video: videos[index],
            imageWidth: imageWidth ?? 192.w,
            relatedVideos: videos
                .where((v) => v.title != videos[index].title)
                .toList(),
          ),
        ),
      ],
    );
  }
}