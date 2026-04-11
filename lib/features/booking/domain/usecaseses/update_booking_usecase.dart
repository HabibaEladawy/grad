import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repo/booking_repository.dart';

class UpdateBookingUseCase extends UseCase<BookingEntity, UpdateBookingParams> {
  final BookingRepository repository;
  UpdateBookingUseCase({required this.repository});

  @override
  Future<Either<Failure, BookingEntity>> call(UpdateBookingParams params) =>
      repository.updateBooking(
        bookingId: params.bookingId,
        date: params.date,
        time: params.time,
      );
}

class UpdateBookingParams extends Equatable {
  final String bookingId;
  final String date;
  final String time;

  const UpdateBookingParams({
    required this.bookingId,
    required this.date,
    required this.time,
  });

  @override
  List<Object?> get props => [bookingId, date, time];
}