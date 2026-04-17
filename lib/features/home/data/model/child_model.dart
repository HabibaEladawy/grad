

import '../../../booking/data/model/booking_model.dart';
import '../../domain/entity/child_entity.dart';

class ChildModel extends ChildEntity {
  const ChildModel({
    required super.id,
    required super.childName,
    required super.age,
    required super.gender,
    required super.role,
    required super.birthDate,
    required super.isActive,
    required super.parentId,
    required super.bookings,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['_id'],
      childName: json['childName'],
      age: json['age'],
      gender: json['gender'],
      role: json['role'],
      birthDate: DateTime.parse(json['birthDate']),
      isActive: json['isActive'],
      parentId: json['parentId'],
      bookings: (json['bookings'] as List)
          .map((e) => BookingModel.fromJson(e))
          .toList(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}