class BookEntity {
  final String id;
  final String title;
  final String description;
  final String author;
  final String cover;
  final String link;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BookEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.cover,
    required this.link,
    required this.createdAt,
    required this.updatedAt,
  });
}