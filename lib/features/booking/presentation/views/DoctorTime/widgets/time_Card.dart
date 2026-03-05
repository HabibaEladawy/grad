import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:flutter/material.dart';


class TimeCard extends StatelessWidget {
  final String textTime;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeCard({
    super.key,
    required this.textTime,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
height: 36,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary_default_light : AppColors.bg_card_default_light,
          borderRadius: BorderRadius.circular(AppRadius.radius_sm),
          border: Border.all(
            color: isSelected
                ? AppColors.bg_card_default_light
                : const Color(0xFFE3E7E8),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_alarm,
              color: isSelected ? Colors.white : AppColors.primary_900_light,
              size: 16,
            ),
            const SizedBox(width: 2),
            Flexible(
              child: Text(
                textTime,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}