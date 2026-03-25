import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/question_Item.dart';
import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/section_Header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../../data/model/examination_model.dart';


class ExamSectionCard extends StatelessWidget {
  final ExamSection section;
  final Function(int questionIndex, ResponseOption option) onAnswerChanged;

  const ExamSectionCard({
    super.key,
    required this.section,
    required this.onAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        borderRadius: BorderRadius.circular(14),
        boxShadow: isDark
            ? []
            : [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExamSectionTitleHeader(section: section),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: section.questions.length,
            itemBuilder: (context, qIndex) {
              return QuestionItem(
                question: section.questions[qIndex],
                onAnswerSelected: (option) => onAnswerChanged(qIndex, option),
              );
            },
          ),
        ],
      ),
    );
  }
}