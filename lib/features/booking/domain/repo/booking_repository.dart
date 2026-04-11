import 'package:dartz/dartz.dart';
import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingEntity>> getBookingById(String id);

  Future<Either<Failure, List<BookingEntity>>> getMyAppointments(String parentId);

  Future<Either<Failure, BookingEntity>> createBooking({
    required String doctorId,
    required String parentId,
    required String childId,
    required String date,
    required String time,
    required String paymentMethod,
    required String visitStatus,
    required double detectionPrice,
    String? notes,
  });

  Future<Either<Failure, BookingEntity>> updateBooking({
    required String bookingId,
    required String date,
    required String time,
  });

  Future<Either<Failure, BookingEntity>> deleteBooking(String id);
}