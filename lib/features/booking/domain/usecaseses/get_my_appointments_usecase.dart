import 'package:dartz/dartz.dart';
import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repo/booking_repository.dart';

class GetMyAppointmentsUseCase extends UseCase<List<BookingEntity>, String> {
  final BookingRepository repository;
  GetMyAppointmentsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BookingEntity>>> call(String parentId) =>
      repository.getMyAppointments(parentId);
}
