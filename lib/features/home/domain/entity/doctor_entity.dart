// doctor_entity.dart
class DoctorEntity {
  final String id;
  final String doctorName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final double ratingAverage;
  final int ratingQuantity;
  final String specialty;
  final double detectionPrice;
  final int expirtes;
  final List<String> avilableDate;
  final List<String> avilableTime;
  final String role;
  final bool isVerified;
  final bool isActive;
  final String? profileImage;
  final List<dynamic> bookings;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DoctorEntity({
    required this.id,
    required this.doctorName,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.ratingAverage,
    required this.ratingQuantity,
    required this.specialty,
    required this.detectionPrice,
    required this.expirtes,
    required this.avilableDate,
    required this.avilableTime,
    required this.role,
    required this.isVerified,
    required this.isActive,
    this.profileImage,
    required this.bookings,
    required this.createdAt,
    required this.updatedAt,
  });
}