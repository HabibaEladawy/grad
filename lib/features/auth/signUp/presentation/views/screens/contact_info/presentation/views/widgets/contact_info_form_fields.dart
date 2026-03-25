
import 'package:dana_graduation_project/core/widgets/custom_Phone%20Field.dart';
import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class ContactInfoFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ContactInfoFormFields({
    super.key,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPhoneField(
          label: AppLocalizations.of(context)!.phoneNumber,
          hintText: '+20',
          controller: phoneController,
        ),
        SizedBox(height: AppSizes.h16),
        CustomTextForm(
          text: AppLocalizations.of(context)!.email,
          hintText: AppLocalizations.of(context)!.enterEmail,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),

      ],
    );
  }
}
