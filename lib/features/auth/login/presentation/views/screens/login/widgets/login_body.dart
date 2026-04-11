import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/core/widgets/otp_bottom_sheet.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_cubit.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_state.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_actions.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_forgot_password.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_password_field.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../../core/utils/app_routes.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInOtpSent) {
          OtpBottomSheet.show(
            context,
            state.phone,
            onVerified: (pin) async {
              await context.read<SignInCubit>().verifySignIn(otp: pin);
            },
          );
        } else if (state is SignInSuccess) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.h32),
            CustomScreenHeader(
              title: AppLocalizations.of(context)!.welcomeBackTitle,
              subtitle: AppLocalizations.of(context)!.loginDesc,
            ),
            SizedBox(height: AppSizes.h32),
            const LoginPhoneField(),
            SizedBox(height: AppSizes.h16),
            const LoginPasswordField(),
            SizedBox(height: AppSizes.h4),
            const LoginForgotPassword(),
            SizedBox(height: AppSizes.h82),
            const LoginActions(),
            SizedBox(height: AppSizes.h24),
          ],
        ),
      ),
    );
  }
}