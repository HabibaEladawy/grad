// doctor_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_all_doctors_usecase.dart';
import '../../domain/usecase/get_doctor_by_id_usecase.dart';
import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final GetAllDoctorsUseCase getAllDoctorsUseCase;
  final GetDoctorByIdUseCase getDoctorByIdUseCase;

  DoctorCubit({
    required this.getAllDoctorsUseCase,
    required this.getDoctorByIdUseCase,
  }) : super(DoctorInitial());

  Future<void> getAllDoctors() async {
    emit(DoctorLoading());
    final result = await getAllDoctorsUseCase();
    result.fold(
          (failure) => emit(DoctorError(message: failure.message)),
          (doctors) => emit(DoctorLoaded(doctors: doctors)),
    );
  }

  Future<void> getDoctorById(String doctorId) async {
    emit(DoctorLoading());
    final result = await getDoctorByIdUseCase(doctorId);
    result.fold(
          (failure) => emit(DoctorError(message: failure.message)),
          (doctor) => emit(DoctorByIdLoaded(doctor: doctor)),
    );
  }
}