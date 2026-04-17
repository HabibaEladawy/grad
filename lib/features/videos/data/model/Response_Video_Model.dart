
import '../../domain/entity/Video_Entity.dart';


class VideoModel extends VideoEntity {
  const VideoModel({
    required super.id,
    required super.title,
    required super.description,
    required super.cover,
    required super.views,
    required super.link,
    required super.time,
    required super.createdAt,
    required super.updatedAt,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      cover: json['cover'] ?? '',
      views: json['views'] ?? 0,
      link: json['link'] ?? '',
      time: json['time'] ?? '00:00:00',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'cover': cover,
      'views': views,
      'link': link,
      'time': time,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}