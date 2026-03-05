import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';

import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/contact_info/presentation/views/screens/Otp_Dialog.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/contact_info/presentation/views/widgets/contact_info_body.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/create_password/views/screens/create_password_screen.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatefulWidget {
  static const String routeName = 'ContactInfoScreen';
  final VoidCallback? onNext;

  const ContactInfoScreen({super.key, required this.onNext});

  @override
  State<ContactInfoScreen> createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    OtpDialog.show(
      context,
      _phoneController.text.isEmpty ? '' : _phoneController.text,
      onVerified: () {
        Navigator.pushNamed(context, CreatePasswordScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppRadius.space_xl),
        child: CustomElevatedButton(
          onTap: _onNextPressed,
          icon: Icons.arrow_forward_ios,
          text: AppLocalizations.of(context)!.getVerificationCode,
        ),
      ),
      body: SafeArea(
        child: ContactInfoBody(
          emailController: _emailController,
          phoneController: _phoneController,
        ),
      ),
    );
  }
}