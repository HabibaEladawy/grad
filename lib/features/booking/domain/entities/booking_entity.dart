

class BookingEntity {
  final String id;
  final String parentId;
  final String childId;
  final String doctorId;
  final String date;           // YYYY-MM-DD
  final String time;           // HH:MM
  final String visitStatus;    // "examination" | ...
  final double detectionPrice;
  final String currency;
  final String status;         // "pending" | "confirmed" | ...
  final String paymentStatus;  // "pending" | "paid"
  final String paymentMethod;  // "visa" | "on-visit"
  final String? paymentProvider;
  final String? paymobOrderId;
  final String? paymobTransactionId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const BookingEntity({
    required this.id,
    required this.parentId,
    required this.childId,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.visitStatus,
    required this.detectionPrice,
    required this.currency,
    required this.status,
    required this.paymentStatus,
    required this.paymentMethod,
    this.paymentProvider,
    this.paymobOrderId,
    this.paymobTransactionId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
}