
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';

import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'child_gender_section.dart';
import 'child_info_form_fields.dart';
import 'custom_add_Child.dart';


class ChildInfoBody extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onGenderSelect;

  const ChildInfoBody({
    super.key,
    required this.selectedIndex,
    required this.onGenderSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.w24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.h48),
            CustomScreenHeader(
              title: AppLocalizations.of(context)!.addChildTitle,
              subtitle: AppLocalizations.of(context)!.addChildDesc,
            ),
            SizedBox(height: AppSizes.h32),
            const ChildInfoFormFields(),
            SizedBox(height: AppSizes.h16),
            ChildGenderSection(
              selectedIndex: selectedIndex,
              onSelect: onGenderSelect,
            ),
            SizedBox(height: AppSizes.h8),
            CustomTextForm(
              text: AppLocalizations.of(context)!.bloodTypeLabel,
              hintText: AppLocalizations.of(context)!.birthDateHint,
              icon: Icons.keyboard_arrow_down_sharp,
            ),
            SizedBox(height: AppSizes.h16),
            const CustomAddChildButtonRow(),
            SizedBox(height: AppSizes.h20),
          ],
        ),
      ),
    );
  }
}