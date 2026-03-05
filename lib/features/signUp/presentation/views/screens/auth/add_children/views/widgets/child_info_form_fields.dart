
import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class ChildInfoFormFields extends StatelessWidget {
  const ChildInfoFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          text: AppLocalizations.of(context)!.childNameLabel,
          hintText: AppLocalizations.of(context)!.childNameHint,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: AppSizes.h16),
        CustomTextForm(
          text: AppLocalizations.of(context)!.birthDateLabel,
          hintText: AppLocalizations.of(context)!.birthDateHint,
          icon: Icons.calendar_month_rounded,
        ),
      ],
    );
  }
}