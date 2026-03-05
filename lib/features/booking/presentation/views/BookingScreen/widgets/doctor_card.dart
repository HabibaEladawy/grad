import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('د.إسلام غنيم', style: AppTextStyle.semibold16TextHeading),
                    const SizedBox(height: 4),
                    Text('أخصائي علاج طبيعي', style: AppTextStyle.medium12TextBody),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: AppColors.primary_900_light),
                        const SizedBox(width: 4),
                        Text('القاهرة - مصر الجديدة', style: AppTextStyle.regular12TextBody),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Divider(color: Color(0xFFE3E7E8)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('التاريخ', style: AppTextStyle.semibold12TextHeading),
                  const SizedBox(height: 4),
                  Text('الخميس 16 نوفمبر', style: AppTextStyle.regular12TextBody),
                ],
              ),
              Column(
                children: [
                  Text('الوقت', style: AppTextStyle.semibold12TextHeading),
                  const SizedBox(height: 4),
                  Text('10:00 ص', style: AppTextStyle.regular12TextBody),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('رقم الحجز', style: AppTextStyle.semibold12TextHeading),
                  const SizedBox(height: 4),
                  Text('#594894', style: AppTextStyle.regular12TextBody),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}