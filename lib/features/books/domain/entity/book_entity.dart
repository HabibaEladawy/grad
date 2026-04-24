class BookEntity {
  final String id;
  final String title;
  final String description;
  final String author;
  final String cover;
  final String link;
  final String createdAt;

  const BookEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.cover,
    required this.link,
    required this.createdAt,
  });


  @override
  String toString() {
    return 'BookEntity(id: $id, title: $title, author: $author)';
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'cover': cover,
      'link': link,
      'createdAt': createdAt,
    };
  }

  factory BookEntity.fromMap(Map<String, dynamic> map) {
    return BookEntity(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      author: map['author'] ?? '',
      cover: map['cover'] ?? '',
      link: map['link'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }
}