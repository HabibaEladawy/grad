
import 'package:dana_graduation_project/core/widgets/Custom_indicator.dart';
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

import 'contact_info_form_fields.dart';


class ContactInfoBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ContactInfoBody({
    super.key,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.w24),
          child: CustomIndicatorRow(
            currentIndex: 2,
            itemCount: 4,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizes.h24),
                  CustomScreenHeader(
                    title: AppLocalizations.of(context)!.howCanWeReachYou,
                    subtitle: AppLocalizations.of(context)!.howCanWeReachYouHint,
                  ),
                  SizedBox(height: AppSizes.h32),
                  ContactInfoFormFields(
                    emailController: emailController,
                    phoneController: phoneController,
                  ),
                  SizedBox(height: AppSizes.h16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}