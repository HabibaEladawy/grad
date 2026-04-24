import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../core/theming/app_text_styles.dart' hide AppColors, AppRadius;
import '../../domain/entity/Video_Entity.dart';
class VideoPlayerWidget extends StatefulWidget {
  final VideoEntity video;

  const VideoPlayerWidget({
    super.key,
    required this.video,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.video.link) ?? '';
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    _controller.addListener(() {
      setState(() {
        _currentPosition = _controller.value.position;
        _totalDuration = _controller.metadata.duration;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _seekBackward() {
    final newPosition = _currentPosition - const Duration(seconds: 10);
    _controller.seekTo(newPosition < Duration.zero ? Duration.zero : newPosition);
  }

  void _seekForward() {
    final newPosition = _currentPosition + const Duration(seconds: 10);
    _controller.seekTo(newPosition > _totalDuration ? _totalDuration : newPosition);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: 392.w,
        height: 256.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_card_default_dark
              : AppColors.bg_card_default_light,
          borderRadius: BorderRadius.circular(AppRadius.radius_lg),
          border: Border(
            top: BorderSide(
              color: isDark
                  ? AppColors.border_card_default_dark
                  : AppColors.border_card_default_light,
              width: AppRadius.stroke_thin,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
///الفيديو
                  Container(
              width: 392.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.radius_lg),
                  topRight: Radius.circular(AppRadius.radius_lg),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: isDark
                        ? AppColors.text_button_disabled_dark
                        : AppColors.text_button_disabled_light,
                    width: 2,
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.radius_lg),
                  topRight: Radius.circular(AppRadius.radius_lg),
                ),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: false,
                ),
              ),
            ),
            // Progress Bar
            GestureDetector(
              onTapDown: (details) {
                final box = context.findRenderObject() as RenderBox;
                final dx = details.localPosition.dx / box.size.width;
                final seekTo = _totalDuration * dx;
                _controller.seekTo(seekTo);
              },
              child: SizedBox(
                height: 3.h,
                child: LinearProgressIndicator(
                  value: _totalDuration.inSeconds > 0
                      ? _currentPosition.inSeconds / _totalDuration.inSeconds
                      : 0,
                  backgroundColor: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.primary_default_light,
                  ),
                ),
              ),
            ),
            /// Controls Row
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  /// -10
                  GestureDetector(
                    onTap: _seekBackward,
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Icon(
                        Icons.forward_10,
                        color: isDark
                            ? AppColors.text_heading_dark
                            : AppColors.text_heading_light,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  /// Play/Pause
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: isDark
                            ? AppColors.text_heading_dark
                            : AppColors.text_heading_light,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  /// +10
                  GestureDetector(
                    onTap: _seekForward,
                    child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Icon(
                        Icons.replay_10,
                        color: isDark
                            ? AppColors.text_heading_dark
                            : AppColors.text_heading_light,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  const Spacer(),
                  /// الوقت على اليمين
                  Text(
                    '${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: isDark
                          ? AppColors.text_body_dark
                          : AppColors.text_body_light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}