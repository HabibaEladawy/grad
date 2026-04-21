import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/parent_profile_repository.dart';
import 'parent_profile_state.dart';

class ParentProfileCubit extends Cubit<ParentProfileState> {
  final ParentProfileRepository repo;

  ParentProfileCubit(this.repo) : super(const ParentProfileInitial());

  Future<void> loadMe() async {
    emit(const ParentProfileLoading());
    try {
      final profile = await repo.getMe();
      emit(ParentProfileLoaded(profile));
    } catch (e) {
      emit(ParentProfileError(e.toString()));
    }
  }

  Future<void> addChild({
    required String childName,
    required String gender,
    required DateTime birthDate,
  }) async {
    emit(const ParentProfileLoading());
    try {
      await repo.addChild(childName: childName, gender: gender, birthDate: birthDate);
      await loadMe();
    } catch (e) {
      emit(ParentProfileError(e.toString()));
    }
  }
}

