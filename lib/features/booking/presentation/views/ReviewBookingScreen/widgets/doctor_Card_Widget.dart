import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';

import 'package:flutter/material.dart';

class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE3E7E8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/Images/doctor_circle.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('د.إسلام غنيم', style: AppTextStyle.semibold16TextHeading),
                    const SizedBox(height: 4),
                    Text('أخصائي علاج طبيعي', style: AppTextStyle.medium12TextBody),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('القاهرة - مصر الجديدة', style: AppTextStyle.regular12TextBody),
                        const SizedBox(width: 4),
                        Icon(Icons.location_on, size: 14, color: AppColors.primary_900_light),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE3E7E8)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('رقم الحجز', style: AppTextStyle.medium12TextBody),
                  const SizedBox(height: 4),
                  Text('#594894', style: AppTextStyle.semibold16TextHeading),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('الوقت', style: AppTextStyle.medium12TextBody),
                  const SizedBox(height: 4),
                  Text('10:00 ص', style: AppTextStyle.semibold16TextHeading),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('التاريخ', style: AppTextStyle.medium12TextBody),
                  const SizedBox(height: 4),
                  Text('الخميس 16 نوفمبر', style: AppTextStyle.semibold16TextHeading),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}