import 'package:dana_graduation_project/core/widgets/custom_textForm.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({super.key});

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      context.read<SignInCubit>().updatePassword(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomTextForm(
        text: AppLocalizations.of(context)!.passwordLabel,
        hintText: AppLocalizations.of(context)!.passwordHint,
        icon: Icons.visibility_outlined,
        controller: _controller,
        obscureText: true,
      ),
    );
  }
}