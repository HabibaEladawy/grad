import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../l10n/app_localizations.dart';

class AISuggestedQuestions extends StatelessWidget {
  final List<String> questions;
  final Function(String) onQuestionTap;

  const AISuggestedQuestions({
    super.key,
    required this.questions,
    required this.onQuestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '✨ ${AppLocalizations.of(context)!.suggestedQuestionsHint}',
                  style: AppTextStyle.medium16TextHeading(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            SizedBox(height: 8.h),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.w,
              runSpacing: 8.h,
              children: questions
                  .map((q) => _QuestionChip(
                label: q,
                onTap: () => onQuestionTap(q),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuestionChip({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 112.w,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.primary_50_light,
          borderRadius: BorderRadius.circular(100.r),
          border: Border(
            top: BorderSide(
              color:AppColors.border_button_outlined_light,
            ),
            bottom: BorderSide(
              color:AppColors.border_button_outlined_light,
            ),
            left: BorderSide(
              color:AppColors.border_button_outlined_light,
            ),
            right: BorderSide(
              color:AppColors.border_button_outlined_light,
            ),
          ),
        ),
        child: Text(
          label,
          style: AppTextStyle.regular12TextBody(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
