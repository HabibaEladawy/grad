import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/examination_model.dart';
import 'exam_Section_Card.dart';

class ExaminationBody extends StatelessWidget {
  final List<ExamSection> sections;
  final Function(int sectionIndex, int questionIndex, ResponseOption option)
  onAnswerChanged;

  const ExaminationBody({
    super.key,
    required this.sections,
    required this.onAnswerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: sections.length,
      itemBuilder: (context, sectionIndex) {
        return ExamSectionCard(
          section: sections[sectionIndex],
          onAnswerChanged: (questionIndex, option) =>
              onAnswerChanged(sectionIndex, questionIndex, option),
        );
      },
    );
  }
}