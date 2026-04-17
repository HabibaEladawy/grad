import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.radius_lg),
        child: Stack(
          children: [
            // YouTube Player
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: false,
            ),

            // Controls Bar في الأسفل
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.85),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Row الأزرار والوقت
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      child: Row(
                        children: [
                          // الوقت على اليسار
                          Text(
                            '${_formatDuration(_currentPosition)} / ${_formatDuration(_totalDuration)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const Spacer(),

                          // -10
                          GestureDetector(
                            onTap: _seekBackward,
                            child: Icon(
                              Icons.replay_10,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Play/Pause
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                              size: 28.sp,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // +10
                          GestureDetector(
                            onTap: _seekForward,
                            child: Icon(
                              Icons.forward_10,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // زرار إضافي
                          Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 22.sp,
                          ),
                        ],
                      ),
                    ),

                    // Progress Bar ملاصق للأسفل بدون padding
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
                              ? _currentPosition.inSeconds /
                              _totalDuration.inSeconds
                              : 0,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary_default_light,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}