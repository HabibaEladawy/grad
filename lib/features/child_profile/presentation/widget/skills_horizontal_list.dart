import 'package:dana/features/child_profile/presentation/widget/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/skill_card_model.dart';
import '../bottom_sheets/skill_checklist_bottom_sheet.dart';
import '../cubit/skills_cubit.dart';
import '../cubit/skills_state.dart';

class SkillsHorizontalList extends StatelessWidget {
  const SkillsHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: BlocBuilder<SkillsCubit, SkillsState>(
          builder: (context, state) {
            if (state is SkillsLoading || state is SkillsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SkillsError) {
              return Center(child: Text(state.message));
            }
            final skills = state is SkillsLoaded
                ? state.skills
                : state is ChecklistLoaded
                    ? state.skills
                    : const [];

            final iconSrcs = [
              'assets/Icons/child_profile/motor_skill_icon.svg',
              'assets/Icons/child_profile/speech_skill_icon.svg',
              'assets/Icons/child_profile/cognition_skill_icon.svg',
              'assets/Icons/child_profile/social_skill_icon.svg',
            ];

            final cards = <SkillCardData>[];
            for (int i = 0; i < skills.length; i++) {
              final s = skills[i];
              cards.add(
                SkillCardData(
                  title: s.name,
                  subtitle: '',
                  iconSrc: iconSrcs[i % iconSrcs.length],
                  count: '${s.itemCount}/0',
                  bottomSheetTitle: s.name,
                  bottomSheetDescription: '',
                  bottomSheetItems: const [],
                ),
              );
            }

            return Row(
              children: [
                for (int i = 0; i < cards.length; i++) ...[
                  GestureDetector(
                    onTap: () {
                      final skillId = skills[i].id;
                      context.read<SkillsCubit>().loadChecklist(skillId);
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => SkillChecklistBottomSheet(
                          skillId: skillId,
                          title: cards[i].bottomSheetTitle,
                          description: cards[i].bottomSheetDescription,
                        ),
                      );
                    },
                    child: SkillCard(data: cards[i]),
                  ),
                  if (i < cards.length - 1) SizedBox(width: 8.w),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
