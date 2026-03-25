

class VideoModel {
  final String title;
  final String duration;
  final String imageUrl;
  final String? description;
  final int? views;
  final String? videoUrl;

  const VideoModel({
    required this.title,
    required this.duration,
    required this.imageUrl,
    this.description,
    this.views,
    this.videoUrl,
  });
}

class VideoSection {
  final String title;
  final List<VideoModel> videos;

  const VideoSection({
    required this.title,
    required this.videos,
  });
}