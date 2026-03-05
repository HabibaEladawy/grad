import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {
  final int value;
  final int groupValue;
  final String label;
  final IconData icon;
  final Color iconColor;
  final ValueChanged<int?> onChanged;

  const PaymentOptionCard({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.icon,
    required this.iconColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        height: 72,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary_default_light.withOpacity(0.1)
              : Colors.white,
          border: Border.all(
            color: isSelected
                ? AppColors.primary_default_light
                : const Color(0xFFE3E7E8),
          ),
            borderRadius: BorderRadius.circular(AppRadius.radius_sm),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor),
                const SizedBox(width: 8),
                Text(label, style: AppTextStyle.medium16TextHeading),
              ],
            ),
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: AppColors.border_button_primary,
            ),
          ],
        ),
      ),
    );
  }
}