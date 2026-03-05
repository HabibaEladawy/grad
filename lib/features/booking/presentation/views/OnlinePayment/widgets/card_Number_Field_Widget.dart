import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CardNumberFieldWidget extends StatelessWidget {
  const CardNumberFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text('رقم البطاقة', style: AppTextStyle.medium12TextHeading),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: TextField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0000 0000 0000 0000',
              hintTextDirection: TextDirection.ltr,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.radius_sm)),
            ),
          ),
        ),
      ],
    );
  }
}