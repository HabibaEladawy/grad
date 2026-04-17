

import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String cover;
  final int views;
  final String link;
  final String time;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VideoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.cover,
    required this.views,
    required this.link,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, title, description, cover, views, link, time];
}