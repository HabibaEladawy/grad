import 'package:dana_graduation_project/features/Examination/presentation/views/widgets/response_Selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../data/model/examination_model.dart';

import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  final ExamQuestion question;
  final ValueChanged<ResponseOption> onAnswerSelected;

  const QuestionItem({
    super.key,
    required this.question,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            style: AppTextStyle.medium16TextBody(context),
          ),
          SizedBox(height: 12.h),
          ResponseSelector(
            selectedOption: question.selectedOption,
            onSelected: onAnswerSelected,
          ),
        ],
      ),
    );
  }
}