import 'package:dana/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
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

  Future<void> _openExternally() async {
    final uri = Uri.tryParse(_url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  void dispose() {
    _disposePlayers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = _initError != null
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _initError!,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.medium12TextBody(context),
                  ),
                  SizedBox(height: 12.h),
                  if (_isYouTube)
                    SizedBox(
                      height: 40.h,
                      child: ElevatedButton(
                        onPressed: _openExternally,
                        child: const Text('Open in YouTube'),
                      ),
                    ),
                ],
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          child: SizedBox(
            width: 392.w,
            height: 256.h,
            child: player,
          ),
        ),
        if (_isYouTube) ...[
          SizedBox(height: 8.h),
          SizedBox(
            height: 40.h,
            child: OutlinedButton(
              onPressed: _openExternally,
              child: const Text('Open in YouTube'),
            ),
          ),
        ],
      ],
    );
  }
}
