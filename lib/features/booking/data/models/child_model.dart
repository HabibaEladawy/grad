class Child {
  final String id;
  final String name;
  final String birthDate;

  Child({required this.id, required this.name, required this.birthDate});

  factory Child.fromJson(dynamic json) {
    if (json is String) {
      return Child(id: json, name: '', birthDate: '');
    }
    if (json is Map<String, dynamic>) {
      return Child(
        id: json['_id']?.toString() ?? '',
        name: json['childName']?.toString() ?? '',
        birthDate: json['birthDate']?.toString() ?? '',
      );
    }
    return Child(id: '', name: '', birthDate: '');
  }
}
