import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'package:flutter/material.dart';


class GenderSelection extends StatelessWidget {
  const GenderSelection({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.circular(AppRadius.space_xs),
      ),
      child: Row(
        children: [
          _GenderItem(
            text: AppLocalizations.of(context)!.boy,
            isSelected: selectedIndex == 0,
            onTap: () => onSelect(0),
          ),
          _GenderItem(
            text: AppLocalizations.of(context)!.girl,
            isSelected: selectedIndex == 1,
            onTap: () => onSelect(1),
          ),
        ],
      ),
    );
  }
}

class _GenderItem extends StatelessWidget {
  const _GenderItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.h12,
            horizontal: AppSizes.w12,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary_50_light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.space_xs),
          ),
          child: Text(
            text,
            style: AppTextStyle.medium16TextHeading.copyWith(
              color: isSelected
                  ? AppColors.primary_default_light
                  : AppColors.text_heading_light,
            ),
          ),
        ),
      ),
    );
  }
}