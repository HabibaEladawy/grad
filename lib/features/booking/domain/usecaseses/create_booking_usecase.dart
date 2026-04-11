import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repo/booking_repository.dart';

class CreateBookingUseCase extends UseCase<BookingEntity, CreateBookingParams> {
  final BookingRepository repository;
  CreateBookingUseCase({required this.repository});

  @override
  Future<Either<Failure, BookingEntity>> call(CreateBookingParams params) =>
      repository.createBooking(
        doctorId: params.doctorId,
        parentId: params.parentId,
        childId: params.childId,
        date: params.date,
        time: params.time,
        paymentMethod: params.paymentMethod,
        visitStatus: params.visitStatus,
        detectionPrice: params.detectionPrice,
        notes: params.notes,
      );
}

class CreateBookingParams extends Equatable {
  final String doctorId;
  final String parentId;
  final String childId;
  final String date;           // YYYY-MM-DD
  final String time;           // HH:MM
  final String paymentMethod;  // "visa" | "on-visit"
  final String visitStatus;    // "examination" | ...
  final double detectionPrice;
  final String? notes;

  const CreateBookingParams({
    required this.doctorId,
    required this.parentId,
    required this.childId,
    required this.date,
    required this.time,
    required this.paymentMethod,
    required this.visitStatus,
    required this.detectionPrice,
    this.notes,
  });

  @override
  List<Object?> get props => [
    doctorId,
    parentId,
    childId,
    date,
    time,
    paymentMethod,
    visitStatus,
    detectionPrice,
    notes,
  ];
}