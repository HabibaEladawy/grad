import 'package:dana/core/utils/app_routes.dart';
import 'package:dana/core/widgets/custom_elevetedButton.dart';
import 'package:dana/core/widgets/custom_screen_header.dart';
import 'package:dana/core/widgets/home_indicator.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/auth/login/presentation/views/screens/new_password/widgets/new_password_fields.dart';
import 'package:flutter/material.dart';
import 'package:dana/core/utils/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HomeIndicator(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSizes.h16),
              CustomScreenHeader(
                title: context.l10n.newPasswordHint,
                subtitle: context.l10n.newPasswordDesc,
              ),
              SizedBox(height: AppSizes.h36),
              const NewPasswordFields(),
              SizedBox(height: AppSizes.h100),
              CustomElevatedButton(
                text: context.l10n.confirmPasswordButton,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.home,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
