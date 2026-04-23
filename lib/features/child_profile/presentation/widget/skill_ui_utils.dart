import '../../data/models/skill_api_models.dart';

/// Same ordering as [SkillsOverviewCard]: skills with a non-empty checklist, max four.
List<SkillApiModel> visibleSkillsUpToFour(
  List<SkillApiModel> skills,
  Map<String, int> totalBySkillId,
) {
  return skills
      .where((s) => (totalBySkillId[s.id] ?? 0) > 0)
      .take(4)
      .toList();
}
