import 'package:dana_graduation_project/features/books/domain/entity/book_entity.dart';


class BookModel extends BookEntity {
  const BookModel({
    required super.id,
    required super.title,
    required super.description,
    required super.author,
    required super.cover,
    required super.link,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      author: json['author'],
      cover: json['cover'],
      link: json['link'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}