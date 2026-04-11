import 'package:dartz/dartz.dart';

import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repo/booking_repository.dart';


class GetBookingByIdUseCase extends UseCase<BookingEntity, String> {
  final BookingRepository repository;
  GetBookingByIdUseCase({required this.repository});

  @override
  Future<Either<Failure, BookingEntity>> call(String id) =>
      repository.getBookingById(id);
}