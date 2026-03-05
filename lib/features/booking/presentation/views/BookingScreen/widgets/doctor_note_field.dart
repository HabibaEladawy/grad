import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
///done
class DoctorNoteField extends StatelessWidget {
  const DoctorNoteField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ملاحظة للطبيب', style: AppTextStyle.medium12TextHeading),
        const SizedBox(height: 8),
        Container(
          width: 392,
          height: 85,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border_card_default_light),
            borderRadius: BorderRadius.circular(AppRadius.radius_sm),
            color: AppColors.bg_card_default_light
          ),
          child: TextField(
            maxLines: 4,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: 'أكتب أي تعليق بسيط.. (اختياري)',
              hintStyle: AppTextStyle.regular12TextBody,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}