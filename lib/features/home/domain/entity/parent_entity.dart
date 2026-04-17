import '../../../booking/domain/entities/booking_entity.dart';
import 'child_entity.dart';

class ParentEntity {
  final String id;
  final String parentName;
  final String email;
  final String phone;
  final String role;
  final bool isVerified;
  final bool isActive;
  final String government;
  final String address;
  final String? profileImage;
  final String? profileImagePublicId;
  final List<ChildEntity> children;
  final List<BookingEntity> bookings;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ParentEntity({
    required this.id,
    required this.parentName,
    required this.email,
    required this.phone,
    required this.role,
    required this.isVerified,
    required this.isActive,
    required this.government,
    required this.address,
    this.profileImage,
    this.profileImagePublicId,
    required this.children,
    required this.bookings,
    required this.createdAt,
    required this.updatedAt,
  });
}