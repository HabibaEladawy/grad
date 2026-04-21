import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_routes.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/create_password_body.dart';

class CreatePasswordScreen extends StatelessWidget {
  static const String routeName = 'CreatePasswordScreen';
  final VoidCallback? onNext;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  CreatePasswordScreen({super.key, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppRadius.radius_xl),
        child: CustomButton(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.login),
          text: context.l10n.createAccount,
        ),
      ),
      body: SafeArea(child: CreatePasswordBody()),
    );
  }
}
