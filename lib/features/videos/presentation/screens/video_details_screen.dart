import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/videos/presentation/screens/view_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_colors.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../domain/entity/Video_Entity.dart';
import '../cubit/video_cubit.dart';
import '../widgets/custom_Section_Header.dart';
import '../widgets/video_player_widget.dart';
import '../widgets/video_info_widget.dart';
import '../widgets/video_Card.dart';

class VideoDetailsScreen extends StatelessWidget {
  static const String routeName = 'VideoDetailsScreen';

  final VideoEntity video;
  final List<VideoEntity> relatedVideos;

  const VideoDetailsScreen({
    super.key,
    required this.video,
    required this.relatedVideos,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: SafeArea(
        child: BlocBuilder<VideoCubit, VideoState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                      textDirection:
                      isRtl ? TextDirection.rtl : TextDirection.ltr,
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

                  // ✅ هنا الربط بالـ API
                  if (state is VideoLoading)
                    const Center(child: CircularProgressIndicator())
                  else if (state is VideoError)
                    Center(child: Text(state.message))
                  else if (state is VideoLoaded)
                      SizedBox(
                        height: 280.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          reverse: isRtl,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: state.videos
                              .where((v) => v.id != video.id)
                              .length,
                          itemBuilder: (context, index) {
                            final related = state.videos
                                .where((v) => v.id != video.id)
                                .toList();
                            final item = related[index];

                            return Padding(
                              padding: EdgeInsets.only(
                                left: isRtl ? 12.w : 0,
                                right: isRtl ? 0 : 12.w,
                              ),
                              child: VideoCard(
                                video: item,
                                relatedVideos: related
                                    .where((v) => v.id != item.id)
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      )
                    else
                      SizedBox(
                        height: 280.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          reverse: isRtl,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: relatedVideos.length,
                          itemBuilder: (context, index) {
                            final item = relatedVideos[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: isRtl ? 12.w : 0,
                                right: isRtl ? 0 : 12.w,
                              ),
                              child: VideoCard(
                                video: item,
                                relatedVideos: relatedVideos
                                    .where((v) => v.id != item.id)
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      ),

                  SizedBox(height: 24.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}