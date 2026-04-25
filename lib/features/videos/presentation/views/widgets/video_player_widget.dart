import 'package:dana/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/video_Model.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoModel video;

  const VideoPlayerWidget({super.key, required this.video});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  YoutubePlayerController? _youtubeController;
  bool _initStarted = false;
  String? _initError;

  String get _url => (widget.video.videoUrl ?? '').trim();

  bool get _isYouTube {
    final u = _url.toLowerCase();
    return u.contains('youtube.com') || u.contains('youtu.be');
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.video.videoUrl != widget.video.videoUrl) {
      _disposePlayers();
      _initStarted = false;
      _initError = null;
      _init();
    }
  }

  Future<void> _init() async {
    if (_initStarted) return;
    _initStarted = true;

    final url = _url;
    if (url.isEmpty) {
      setState(() => _initError = 'Video link is not available');
      return;
    }

    try {
      if (_isYouTube) {
        final videoId = YoutubePlayerController.convertUrlToId(url);
        if (videoId == null || videoId.isEmpty) {
          setState(() => _initError = 'Invalid YouTube link');
          return;
        }
        _youtubeController = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: false,
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            strictRelatedVideos: true,
          ),
        );
        if (mounted) setState(() {});
        return;
      }

      final uri = Uri.tryParse(url);
      if (uri == null) {
        setState(() => _initError = 'Invalid video link');
        return;
      }

      final controller = VideoPlayerController.networkUrl(uri);
      _videoController = controller;
      await controller.initialize();
      _chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: false,
        looping: false,
        allowFullScreen: true,
        allowPlaybackSpeedChanging: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.primary_default_light,
          bufferedColor: AppColors.border_card_default_light,
          handleColor: AppColors.primary_default_light,
          backgroundColor: AppColors.border_card_default_light,
        ),
      );
      if (mounted) setState(() {});
    } catch (e) {
      if (mounted) {
        setState(() => _initError = 'Failed to load video');
      }
    }
  }

  void _disposePlayers() {
    _chewieController?.dispose();
    _chewieController = null;
    _videoController?.dispose();
    _videoController = null;
    _youtubeController?.close();
    _youtubeController = null;
  }

  @override
  void dispose() {
    _disposePlayers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    final iconColor = isDark
        ? AppColors.icon_onLight_dark
        : AppColors.icon_onLight_light;
    final player = _initError != null
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                _initError!,
                textAlign: TextAlign.center,
                style: AppTextStyle.medium12TextBody(context),
              ),
            ),
          )
        : (_youtubeController != null
            ? YoutubePlayer(
                controller: _youtubeController!,
                aspectRatio: 392 / 256,
              )
            : (_chewieController != null
                ? Chewie(controller: _chewieController!)
                : const Center(child: CircularProgressIndicator())));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          child: SizedBox(
            width: 392.w,
            height: 256.h,
            child: player,
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.bg_card_default_dark
                  : AppColors.bg_card_default_light,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(12),
              ),
            ),
            padding: EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              right: 16.w,
              bottom: 8.h,
            ),
            child: Row(
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.video.duration,
                  style: AppTextStyle.medium12TextBody(context),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.replay_10, color: iconColor, size: 24.w),

                    SizedBox(width: 8.w),
                    Icon(Icons.pause, color: iconColor, size: 24.w),
                    SizedBox(width: 8.w),
                    Icon(Icons.forward_10, color: iconColor, size: 24.w),
                  ],
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 44.h,
          left: 0,
          right: 0,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              trackHeight: 2,
              trackShape: const RectangularSliderTrackShape(),
              activeTrackColor: isDark
                  ? AppColors.primary_default_dark
                  : AppColors.primary_default_light,
              inactiveTrackColor: isDark
                  ? AppColors.primary_default_dark.withAlpha(77)
                  : AppColors.primary_default_light.withAlpha(77),
              thumbColor: isDark
                  ? AppColors.primary_default_dark
                  : AppColors.primary_default_light,
            ),
            child: Slider(value: 0.0, onChanged: (_) {}),
          ),
        ),
      ],
    );
  }
}
