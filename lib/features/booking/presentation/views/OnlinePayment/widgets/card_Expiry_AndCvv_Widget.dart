import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CardExpiryAndCvvWidget extends StatelessWidget {
  const CardExpiryAndCvvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تاريخ الانتهاء', style: AppTextStyle.medium12TextHeading),
              const SizedBox(height: 8),
              TextField(
                textAlign: TextAlign.right,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: 'MM / YY',
                  hintStyle: AppTextStyle.regular12TextBody,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.radius_sm)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('رمز الأمان', style: AppTextStyle.medium12TextHeading),
              const SizedBox(height: 8),
              TextField(
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'CVV',
                  hintStyle: AppTextStyle.regular12TextBody,
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}