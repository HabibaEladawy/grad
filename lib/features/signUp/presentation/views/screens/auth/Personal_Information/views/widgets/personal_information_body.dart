
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/Personal_Information/views/widgets/personal_information_actions.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/Personal_Information/views/widgets/personal_information_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class PersonalInformationBody extends StatelessWidget {
  final VoidCallback? onNext;

  const PersonalInformationBody({super.key, required this.onNext});

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
              title: AppLocalizations.of(context)!.personalInfoTitle,
              subtitle: AppLocalizations.of(context)!.personalInfoDesc,
            ),
            SizedBox(height: AppSizes.h32),
            const PersonalInformationFormFields(),
            SizedBox(height: AppSizes.h48),
            PersonalInformationActions(onNext: onNext),
            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }
}