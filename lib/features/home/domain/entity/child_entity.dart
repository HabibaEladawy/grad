import '../../../booking/domain/entities/booking_entity.dart';

class ChildEntity {
  final String id;
  final String childName;
  final int age;
  final String gender;
  final String role;
  final DateTime birthDate;
  final bool isActive;
  final String parentId;
  final List<BookingEntity> bookings;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ChildEntity({
    required this.id,
    required this.childName,
    required this.age,
    required this.gender,
    required this.role,
    required this.birthDate,
    required this.isActive,
    required this.parentId,
    required this.bookings,
    required this.createdAt,
    required this.updatedAt,
  });
}