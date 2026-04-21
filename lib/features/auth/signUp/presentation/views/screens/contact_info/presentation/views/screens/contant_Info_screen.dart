import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/widgets/custom_elevetedButton.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import '../../../../create_password/views/screens/create_password_screen.dart';
import '../widgets/contact_info_body.dart';
import 'Otp_Dialog.dart';

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
          text: context.l10n.getVerificationCode,
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
