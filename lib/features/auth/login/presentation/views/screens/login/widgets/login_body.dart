import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_state.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_actions.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_forgot_password.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_password_field.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/sign_in_cubit.dart';


class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if(state is SignInSuccess){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSizes.h32),
          CustomScreenHeader(
            title: AppLocalizations.of(context)!.welcomeBackTitle,
            subtitle: AppLocalizations.of(context)!.loginDesc,
          ),
          SizedBox(height: AppSizes.h32),
          LoginPhoneField(),
          SizedBox(height: AppSizes.h16),
          const LoginPasswordField(),
          SizedBox(height: AppSizes.h4),
          const LoginForgotPassword(),
          SizedBox(height: AppSizes.h82),
          const LoginActions(),
          SizedBox(height: AppSizes.h24),
        ],
      ),
    );
  }
}