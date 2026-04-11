import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

class BookingModel extends BookingEntity {
  const BookingModel({
    required super.id,
    required super.parentId,
    required super.childId,
    required super.doctorId,
    required super.date,
    required super.time,
    required super.visitStatus,
    required super.detectionPrice,
    required super.currency,
    required super.status,
    required super.paymentStatus,
    required super.paymentMethod,
    super.paymentProvider,
    super.paymobOrderId,
    super.paymobTransactionId,
    super.notes,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['_id']?.toString() ?? '',
      parentId: json['parentId']?.toString() ?? '',
      childId: json['childId']?.toString() ?? '',
      doctorId: json['doctorId']?.toString() ?? '',
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      visitStatus: json['visitStatus']?.toString() ?? '',
      detectionPrice: (json['detectionPrice'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency']?.toString() ?? 'EGP',
      status: json['status']?.toString() ?? 'pending',
      paymentStatus: json['paymentStatus']?.toString() ?? 'pending',
      paymentMethod: json['paymentMethod']?.toString() ?? '',
      paymentProvider: json['paymentProvider']?.toString(),
      paymobOrderId: json['paymobOrderId']?.toString(),
      paymobTransactionId: json['paymobTransactionId']?.toString(),
      notes: json['notes']?.toString(),
      createdAt: DateTime.tryParse(json['createdAt']?.toString() ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt']?.toString() ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'parentId': parentId,
      'childId': childId,
      'doctorId': doctorId,
      'date': date,
      'time': time,
      'visitStatus': visitStatus,
      'detectionPrice': detectionPrice,
      'currency': currency,
      'status': status,
      'paymentStatus': paymentStatus,
      'paymentMethod': paymentMethod,
      'paymentProvider': paymentProvider,
      'paymobOrderId': paymobOrderId,
      'paymobTransactionId': paymobTransactionId,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
