import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/error_mapper.dart';
import '../../../parent_profile/data/models/parent_profile_model.dart';
import '../../../parent_profile/data/repo/parent_profile_repository.dart';
import '../../data/repo/skills_repo.dart';
import 'skills_state.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final SkillsRepo repo;
  final ParentProfileRepository parentRepo;

  SkillsCubit({required this.repo, required this.parentRepo})
      : super(const SkillsInitial());

  ParentChildModel? _pickChild(ParentProfileModel me, String? preferredId) {
    if (preferredId != null && preferredId.isNotEmpty) {
      for (final c in me.children) {
        if (c.id == preferredId) return c;
      }
    }
    return me.children.isNotEmpty ? me.children.first : null;
  }

  Future<void> loadSkills({String? childId}) async {
    emit(const SkillsLoading());
    try {
      final me = await parentRepo.getMe();
      final child = _pickChild(me, childId);
      final resolvedId = child?.id ?? '';
      if (resolvedId.isEmpty) throw Exception('No child found');
      final skills = await repo.getSkills();
      emit(SkillsLoaded(childId: resolvedId, skills: skills));
    } catch (e) {
      emit(SkillsError(ErrorMapper.message(e)));
    }
  }

  Future<void> loadChecklist(String skillId) async {
    final current = state;
    if (current is! SkillsLoaded && current is! ChecklistLoaded) return;
    final childId = current is SkillsLoaded ? current.childId : (current as ChecklistLoaded).childId;
    final skills = current is SkillsLoaded ? current.skills : (current as ChecklistLoaded).skills;

    emit(ChecklistLoading(childId: childId, skills: skills, skillId: skillId));
    try {
      final items = await repo.getChecklist(skillId: skillId, childId: childId);
      emit(
        ChecklistLoaded(
          childId: childId,
          skills: skills,
          skillId: skillId,
          items: items,
        ),
      );
    } catch (e) {
      emit(SkillsError(ErrorMapper.message(e)));
    }
  }

  Future<void> toggle({
    required String skillId,
    required String itemId,
    required bool checked,
  }) async {
    final current = state;
    if (current is! ChecklistLoaded) return;
    try {
      await repo.toggleItem(childId: current.childId, itemId: itemId, checked: checked);
      final items = await repo.getChecklist(skillId: skillId, childId: current.childId);
      emit(
        ChecklistLoaded(
          childId: current.childId,
          skills: current.skills,
          skillId: skillId,
          items: items,
        ),
      );
    } catch (e) {
      emit(SkillsError(ErrorMapper.message(e)));
    }
  }
}

