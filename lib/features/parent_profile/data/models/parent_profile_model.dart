class ParentProfileModel {
  final String id;
  final String parentName;
  final String phone;
  final List<ParentChildModel> children;

  ParentProfileModel({
    required this.id,
    required this.parentName,
    required this.phone,
    required this.children,
  });

  factory ParentProfileModel.fromJson(Map<String, dynamic> json) {
    final childrenJson = (json['children'] as List?) ?? const [];
    return ParentProfileModel(
      id: json['_id']?.toString() ?? '',
      parentName: json['parentName']?.toString() ?? '',
      phone: json['phone']?.toString() ?? '',
      children: childrenJson
          .whereType<Map>()
          .map((c) => ParentChildModel.fromJson(c.cast<String, dynamic>()))
          .toList(),
    );
  }
}

class ParentChildModel {
  final String id;
  final String childName;
  final String gender;
  final DateTime? birthDate;

  ParentChildModel({
    required this.id,
    required this.childName,
    required this.gender,
    required this.birthDate,
  });

  factory ParentChildModel.fromJson(Map<String, dynamic> json) {
    final rawBirth = json['birthDate']?.toString();
    DateTime? parsed;
    if (rawBirth != null && rawBirth.isNotEmpty) {
      parsed = DateTime.tryParse(rawBirth);
    }
    return ParentChildModel(
      id: json['_id']?.toString() ?? '',
      childName: json['childName']?.toString() ?? '',
      gender: json['gender']?.toString() ?? '',
      birthDate: parsed,
    );
  }
}

