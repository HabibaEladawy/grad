
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'gender_selection.dart';


class ChildGenderSection extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const ChildGenderSection({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.childGender,
          style: AppTextStyle.medium12TextHeading(context),
        ),
        SizedBox(height: AppSizes.h8),
        GenderSelection(
          selectedIndex: selectedIndex,
          onSelect: onSelect,
        ),
      ],
    );
  }
}
