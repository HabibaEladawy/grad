
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/add_children/views/widgets/gender_selection.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';


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
          style: AppTextStyle.medium12TextHeading,
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
