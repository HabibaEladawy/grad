import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/core/widgets/custom_screen_header.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/change_password_cubit.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/change_password_state.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/reset_password_cubit.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/reset_password_state.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/widgets/new_password_drag_indicator.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/widgets/new_password_fields.dart';
import 'package:flutter/material.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordBody extends StatefulWidget {
  const NewPasswordBody({super.key});

  @override
  State<NewPasswordBody> createState() => _NewPasswordBodyState();
}

class _NewPasswordBodyState extends State<NewPasswordBody> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onConfirmPressed() {
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (password.isEmpty || confirm.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك ادخل كلمة المرور')),
      );
      return;
    }

    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('كلمتا المرور غير متطابقتين')),
      );
      return;
    }

    // نجيب الـ phone و otp من الـ ResetPasswordCubit
    final resetState = context.read<ResetPasswordCubit>().state;
    if (resetState is! ResetPasswordOtpVerified) return;

    context.read<ChangePasswordCubit>().changePassword(
      phone: resetState.phone,
      password: password,
      token: '', // مفيش token في reset flow – الـ API بيستخدم phone + otp
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.home,
                (route) => false,
          );
        } else if (state is ChangePasswordFailure) {
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
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 34.5, horizontal: 24),
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
                NewPasswordFields(
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                SizedBox(height: AppSizes.h32),
                CustomElevatedButton(
                  text: AppLocalizations.of(context)!.confirmPasswordButton,
                  onTap: state is ChangePasswordLoading
                      ? null
                      : _onConfirmPressed,
                ),
                SizedBox(height: AppSizes.h24),
              ],
            ),
          ),
        );
      },
    );
  }
}