
import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class PersonalInformationFormFields extends StatelessWidget {
  const PersonalInformationFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm(
          text: AppLocalizations.of(context)!.fullNameLabel,
          hintText: AppLocalizations.of(context)!.fullNameHint,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: AppSizes.h8),
        CustomTextForm(
          text: AppLocalizations.of(context)!.governorateLabel,
          hintText: AppLocalizations.of(context)!.governorateHint,
          icon: Icons.keyboard_arrow_down,
          readOnly: true,
          onTap: () {
            // TODO: Open governorate dropdown
          },
        ),
        SizedBox(height: AppSizes.h8),
        CustomTextForm(
          text: AppLocalizations.of(context)!.addressLabel,
          hintText: AppLocalizations.of(context)!.addressHint,
          keyboardType: TextInputType.streetAddress,
        ),
      ],
    );
  }
}