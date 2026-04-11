import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_cubit.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_state.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/custom_alreadyHaveAccount.dart';
import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/custom_text_rich.dart';
import '../../../../../../signUp/presentation/views/screens/Personal_Information/views/widgets/cutom_google_signUp.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInOtpSent) {
          // روح لصفحة OTP وبعت الـ phone معاك
          // OtpDialog.show(context, state.phone);
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
      builder: (context, state) {
        return Column(
          children: [
            CustomElevatedButton(
              text: AppLocalizations.of(context)!.loginButton,
              onTap: state is SignInLoading
                  ? null
                  : () => context.read<SignInCubit>().preSignIn(),
            ),
            SizedBox(height: AppSizes.h44),
            const CustomTextRich(),
            const GoogleSignUpButton(),
            CustomAlreadyHaveAccount(
              textOne: AppLocalizations.of(context)!.noAccount,
              textTwo: AppLocalizations.of(context)!.createAccount,
            ),
          ],
        );
      },
    );
  }
}