part of 'video_cubit.dart';

@immutable

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object?> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoEntity> videos;
  const VideoLoaded(this.videos);

  @override
  List<Object?> get props => [videos];
}

class VideoError extends VideoState {
  final String message;
  const VideoError(this.message);

  @override
  List<Object?> get props => [message];
}

// ✅ جديد للـ search
class VideoSearchLoading extends VideoState {}

class VideoSearchLoaded extends VideoState {
  final List<VideoEntity> videos;
  const VideoSearchLoaded(this.videos);

  @override
  List<Object?> get props => [videos];
}

class VideoSearchEmpty extends VideoState {}
