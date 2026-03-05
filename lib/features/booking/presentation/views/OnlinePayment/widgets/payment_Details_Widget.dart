import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';

class PaymentDetailsWidget extends StatelessWidget {
  const PaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('تفاصيل الدفع', style: AppTextStyle.medium16TextDisplay),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bg_card_default_light,
            border: Border.all(color: AppColors.border_card_default_light),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('تكلفة الخدمة', style: AppTextStyle.medium12TextHeading),
                  Text('250 ج', style: AppTextStyle.semibold12TextHeading),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ضريبة', style: AppTextStyle.semibold12TextHeading),
                  Text('0 ج', style: AppTextStyle.medium12TextHeading),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 64,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bg_button_primary_disabled_light,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('إجمالي التكلفة', style: AppTextStyle.medium12TextDisplay),
              Text('250 ج', style: AppTextStyle.semibold16TextHeading),
            ],
          ),
        ),
      ],
    );
  }
}