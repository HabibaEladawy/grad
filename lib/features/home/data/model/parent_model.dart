import '../../../booking/data/model/booking_model.dart';
import '../../domain/entity/parent_entity.dart';
import 'child_model.dart';

class ParentModel extends ParentEntity {
  const ParentModel({
    required super.id,
    required super.parentName,
    required super.email,
    required super.phone,
    required super.role,
    required super.isVerified,
    required super.isActive,
    required super.government,
    required super.address,
    super.profileImage,
    super.profileImagePublicId,
    required super.children,
    required super.bookings,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    final data = json['response']['data'];
    return ParentModel(
      id: data['_id'],
      parentName: data['parentName'],
      email: data['email'],
      phone: data['phone'],
      role: data['role'],
      isVerified: data['isVerified'],
      isActive: data['isActive'],
      government: data['government'],
      address: data['address'],
      profileImage: data['profileImage'],
      profileImagePublicId: data['profileImagePublicId'],
      children: (data['children'] as List)
          .map((e) => ChildModel.fromJson(e))
          .toList(),
      bookings: (data['bookings'] as List)
          .map((e) => BookingModel.fromJson(e))
          .toList(),
      createdAt: DateTime.parse(data['createdAt']),
      updatedAt: DateTime.parse(data['updatedAt']),
    );
  }
}