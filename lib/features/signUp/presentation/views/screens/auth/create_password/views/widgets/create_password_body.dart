
import 'package:dana_graduation_project/core/widgets/Custom_indicator.dart';
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/create_password/views/widgets/create_password_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class CreatePasswordBody extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const CreatePasswordBody({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSizes.w24),
          child: CustomIndicatorRow(
            currentIndex: 3,
            itemCount: 4,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w24),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.h24),
                    CustomScreenHeader(
                      title: AppLocalizations.of(context)!.choosePasswordTitle,
                      subtitle: AppLocalizations.of(context)!.choosePasswordDesc,
                    ),
                    SizedBox(height: AppSizes.h32),
                    CreatePasswordFormFields(
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    SizedBox(height: AppSizes.h48),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}