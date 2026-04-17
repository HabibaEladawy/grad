// get_all_doctors_usecase.dart
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/doctor_entity.dart';
import '../repo/doctor_repository.dart';

class GetAllDoctorsUseCase {
  final DoctorRepository repository;

  GetAllDoctorsUseCase({required this.repository});

  Future<Either<Failure, List<DoctorEntity>>> call() {
    return repository.getAllDoctors();
  }
}