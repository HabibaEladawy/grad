class Doctor {
  final String id;
  final String name;
  final int price;
  final String? profileImage;
  final String specialty;
  final String city;
  final String address;

  Doctor({
    required this.id,
    required this.name,
    required this.price,
    this.profileImage,
    this.specialty = '',
    this.city = '',
    this.address = '',
  });

  String get locationLine {
    final parts = <String>[city, address].where((e) => e.trim().isNotEmpty).toList();
    return parts.join(', ');
  }

  factory Doctor.fromJson(dynamic json) {
    if (json is String) {
      return Doctor(id: json, name: '', price: 0);
    }
    if (json is Map<String, dynamic>) {
      return Doctor(
        id: json['_id']?.toString() ?? '',
        name: json['doctorName']?.toString() ?? '',
        price: int.tryParse(json['detectionPrice']?.toString() ?? '') ?? 0,
        profileImage: json['profileImage']?.toString(),
        specialty: json['specialty']?.toString() ?? '',
        city: json['city']?.toString() ?? '',
        address: json['address']?.toString() ?? '',
      );
    }
    return Doctor(id: '', name: '', price: 0);
  }
}
