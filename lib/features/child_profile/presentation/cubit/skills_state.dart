import '../../data/models/skill_api_models.dart';

sealed class SkillsState {
  const SkillsState();
}

class SkillsInitial extends SkillsState {
  const SkillsInitial();
}

class SkillsLoading extends SkillsState {
  const SkillsLoading();
}

class SkillsLoaded extends SkillsState {
  final String childId;
  final List<SkillApiModel> skills;

  const SkillsLoaded({
    required this.childId,
    required this.skills,
  });
}

class ChecklistLoading extends SkillsState {
  final String childId;
  final List<SkillApiModel> skills;
  final String skillId;

  const ChecklistLoading({
    required this.childId,
    required this.skills,
    required this.skillId,
  });
}

class ChecklistLoaded extends SkillsState {
  final String childId;
  final List<SkillApiModel> skills;
  final String skillId;
  final List<SkillChecklistItemApiModel> items;

  const ChecklistLoaded({
    required this.childId,
    required this.skills,
    required this.skillId,
    required this.items,
  });
}

class SkillsError extends SkillsState {
  final String message;
  const SkillsError(this.message);
}

