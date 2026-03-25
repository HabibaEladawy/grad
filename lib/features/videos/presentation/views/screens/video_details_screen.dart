import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/videos/presentation/views/screens/videos_Screen.dart';
import 'package:dana_graduation_project/features/videos/presentation/views/screens/view_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/video_Model.dart';
import '../widgets/custom_Section_Header.dart';
import '../widgets/video_player_widget.dart';
import '../widgets/video_info_widget.dart';
import '../widgets/video_Card.dart';

class VideoDetailsScreen extends StatelessWidget {
  static const String routeName = 'VideoDetailsScreen';
  final VideoModel video;
  final List<VideoModel> relatedVideos;

  const VideoDetailsScreen({
    super.key,
    required this.video,
    required this.relatedVideos,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
            isRtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              CustomSectionHeader(title: l10n.videos),
              SizedBox(height: 24.h),
              VideoPlayerWidget(video: video),
              SizedBox(height: 16.h),
              VideoInfoWidget(video: video),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.relatedVideos,
                      style: AppTextStyle.medium16TextHeading(context),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ViewAllScreen(
                              videos: getVideoSections(context)
                                  .expand((section) => section.videos)
                                  .where((v) => v.title != video.title)
                                  .toList(),
                              sectionTitle: l10n.relatedVideos,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        l10n.viewAll,
                        style: AppTextStyle.regular12TextBody(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 280.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: isRtl,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: relatedVideos.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: isRtl ? 12.w : 0,
                      right: isRtl ? 0 : 12.w,
                    ),
                    child: VideoCard(video: relatedVideos[index]),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}