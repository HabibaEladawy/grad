// doctor_state.dart
import '../../domain/entity/doctor_entity.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<DoctorEntity> doctors;
  DoctorLoaded({required this.doctors});
}

class DoctorByIdLoaded extends DoctorState {
  final DoctorEntity doctor;
  DoctorByIdLoaded({required this.doctor});
}

class DoctorError extends DoctorState {
  final String message;
  DoctorError({required this.message});
}