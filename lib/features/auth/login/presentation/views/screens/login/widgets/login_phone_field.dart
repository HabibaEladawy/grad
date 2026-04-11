import 'package:dana_graduation_project/core/widgets/custom_Phone%20Field.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';

class LoginPhoneField extends StatefulWidget {
  const LoginPhoneField({super.key});

  @override
  State<LoginPhoneField> createState() => _LoginPhoneFieldState();
}

class _LoginPhoneFieldState extends State<LoginPhoneField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      context.read<SignInCubit>().updatePhone(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPhoneField(
      label: AppLocalizations.of(context)!.phoneNumber,
      hintText: AppLocalizations.of(context)!.timer,
      controller: _controller,
    );
  }
}