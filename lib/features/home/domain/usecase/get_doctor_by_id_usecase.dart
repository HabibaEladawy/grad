// get_doctor_by_id_usecase.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/doctor_entity.dart';
import '../repo/doctor_repository.dart';

class GetDoctorByIdUseCase {
  final DoctorRepository repository;

  GetDoctorByIdUseCase({required this.repository});

  Future<Either<Failure, DoctorEntity>> call(String doctorId) {
    return repository.getDoctorById(doctorId);
  }
}