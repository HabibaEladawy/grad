import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../parent_profile/data/repo/parent_profile_repository.dart';
import '../../data/repo/child_vaccination_repo.dart';
import '../../data/repo/child_vaccination_schedule_repo.dart';
import 'vaccination_schedule_state.dart';

class VaccinationScheduleCubit extends Cubit<VaccinationScheduleState> {
  final ParentProfileRepository parentRepo;
  final ChildVaccinationScheduleRepo scheduleRepo;
  final ChildVaccinationRepo vaccinationRepo;

  VaccinationScheduleCubit({
    required this.parentRepo,
    required this.scheduleRepo,
    required this.vaccinationRepo,
  }) : super(const VaccinationScheduleInitial());

  Future<void> load() async {
    emit(const VaccinationScheduleLoading());
    try {
      final me = await parentRepo.getMe();
      final childId = me.children.isNotEmpty ? me.children.first.id : '';
      if (childId.isEmpty) {
        throw Exception('No child found for this parent');
      }
      final items = await scheduleRepo.getSchedule(childId: childId);
      emit(VaccinationScheduleLoaded(childId: childId, items: items));
    } catch (e) {
      emit(VaccinationScheduleError(e.toString()));
    }
  }

  Future<void> generateAndLoad() async {
    emit(const VaccinationScheduleLoading());
    try {
      final me = await parentRepo.getMe();
      final childId = me.children.isNotEmpty ? me.children.first.id : '';
      if (childId.isEmpty) {
        throw Exception('No child found for this parent');
      }
      await scheduleRepo.generateSchedule(childId: childId);
      final items = await scheduleRepo.getSchedule(childId: childId);
      emit(VaccinationScheduleLoaded(childId: childId, items: items));
    } catch (e) {
      emit(VaccinationScheduleError(e.toString()));
    }
  }

  Future<void> markTaken({
    required String childId,
    required String vaccinationId,
    required DateTime takenDate,
  }) async {
    emit(const VaccinationScheduleLoading());
    try {
      await vaccinationRepo.markTaken(
        childId: childId,
        vaccinationId: vaccinationId,
        takenDate: takenDate,
      );
      final items = await scheduleRepo.getSchedule(childId: childId);
      emit(VaccinationScheduleLoaded(childId: childId, items: items));
    } catch (e) {
      emit(VaccinationScheduleError(e.toString()));
    }
  }
}

