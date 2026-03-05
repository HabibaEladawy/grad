import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'package:flutter/material.dart';

class CustomAddChildButtonRow extends StatelessWidget {
  final VoidCallback? onTap;

  const CustomAddChildButtonRow({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.r20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(

            padding: EdgeInsets.all(AppSizes.w6),
            decoration: BoxDecoration(
              color: AppColors.icon_onLight_light,
              borderRadius: BorderRadius.circular(AppSizes.r20),
            ),
            child: Icon(
              Icons.add,
              color: AppColors.bg_surface_default_light,
              size: AppSizes.w24,
            ),
          ),
          SizedBox(width: AppSizes.w8),
          Text(
            AppLocalizations.of(context)!.addAnotherChild,
            style: AppTextStyle.medium16PrimaryDefault,
          ),
        ],
      ),
    );
  }
}