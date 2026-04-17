// doctor_repository.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/doctor_entity.dart';

abstract class DoctorRepository {
  Future<Either<Failure, List<DoctorEntity>>> getAllDoctors();
  Future<Either<Failure, DoctorEntity>> getDoctorById(String doctorId);
}