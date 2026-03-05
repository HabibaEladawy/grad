import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CardHolderNameWidget extends StatelessWidget {
  const CardHolderNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text('اسم صاحب البطاقة', style: AppTextStyle.medium12TextHeading),
        ),
        const SizedBox(height: 8),
        TextField(
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: 'اكتب الاسم كما هو على البطاقة',
            hintStyle: AppTextStyle.regular12TextBody,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}