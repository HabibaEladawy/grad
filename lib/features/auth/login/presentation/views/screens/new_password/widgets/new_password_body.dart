
import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/widgets/new_password_drag_indicator.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/widgets/new_password_fields.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34.5, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const NewPasswordDragIndicator(),
            SizedBox(height: AppSizes.h16),
            CustomScreenHeader(
              title: AppLocalizations.of(context)!.newPasswordHint,
              subtitle: AppLocalizations.of(context)!.newPasswordDesc,
            ),
            SizedBox(height: AppSizes.h32),
            const NewPasswordFields(),
            SizedBox(height: AppSizes.h32),
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.confirmPasswordButton,
              onTap: () {
               Navigator.of(context).pushNamed(AppRoutes.home);
              },
            ),
            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }
}