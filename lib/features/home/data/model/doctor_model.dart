// doctor_model.dart
import '../../domain/entity/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  const DoctorModel({
    required super.id,
    required super.doctorName,
    required super.email,
    required super.phone,
    required super.address,
    required super.city,
    required super.ratingAverage,
    required super.ratingQuantity,
    required super.specialty,
    required super.detectionPrice,
    required super.expirtes,
    required super.avilableDate,
    required super.avilableTime,
    required super.role,
    required super.isVerified,
    required super.isActive,
    super.profileImage,
    required super.bookings,
    required super.createdAt,
    required super.updatedAt,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['_id'] ?? '',
      doctorName: json['doctorName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      ratingAverage: (json['ratingAverage'] as num?)?.toDouble() ?? 0.0, // ✅ ناقصة
      ratingQuantity: (json['ratingQuantity'] as num?)?.toInt() ?? 0,
      specialty: json['specialty'] ?? '',
      detectionPrice: (json['detectionPrice'] as num?)?.toDouble() ?? 0.0,
      expirtes: (json['expirtes'] as num?)?.toInt() ?? 0,
      avilableDate: List<String>.from(json['avilableDate'] ?? []),
      avilableTime: List<String>.from(json['avilableTime'] ?? []),
      role: json['role'] ?? '',
      isVerified: json['isVerified'] ?? false,
      isActive: json['isActive'] ?? false,
      profileImage: json['profileImage'],
      bookings: List.from(json['bookings'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );  }
}