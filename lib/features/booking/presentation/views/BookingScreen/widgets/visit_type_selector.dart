import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisitTypeSelector extends StatelessWidget {

  final int selectedIndex;
  final List<String> visitTypes;
  final Function(int) onSelect;

  const VisitTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.visitTypes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('نوع الزيارة', style: AppTextStyle.medium12TextBody),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            visitTypes.length,
                (index) => Expanded(
              child: GestureDetector(
                onTap: () => onSelect(index),
                child: Container(
                  margin: EdgeInsets.only(left: index == 0 ? 8 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? AppColors.primary_50_light
                        : Colors.white,
                    border: Border.all(color: const Color(0xFFE3E7E8)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    visitTypes[index],
                    textAlign: TextAlign.center,
                    style: AppTextStyle.medium12TextBody.copyWith(
                      color: selectedIndex == index
                          ? AppColors.text_heading_light
                          : AppColors.text_body_light,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

