import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 207,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4DD9C0), Color(0xFFD4A574)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/Images/logos_mastercard.png', height: 53, width: 53),
              Text('Credit', style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Card holder', style: AppTextStyle.medium12TextBody.copyWith(color: Colors.white70)),
              Text('???? - ???? - ???? - ????', style: AppTextStyle.medium16TextDisplay.copyWith(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}