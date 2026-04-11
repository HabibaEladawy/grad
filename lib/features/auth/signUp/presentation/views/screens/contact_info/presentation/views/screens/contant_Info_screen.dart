import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/widgets/custom_elevetedButton.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../../providers/app_theme_provider.dart';
import '../../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../../../../../../../../login/presentation/cubit/sign_up_state.dart';
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

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(
            () => context.read<SignUpCubit>().updatePhone(_phoneController.text));
    _emailController.addListener(
            () => context.read<SignUpCubit>().updateEmail(_emailController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpOtpSent) {
          // OTP اتبعت – افتح الـ OTP dialog
          OtpDialog.show(
            context,
            state.phone,
            onVerified: () {
              Navigator.pushNamed(context, CreatePasswordScreen.routeName);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(AppRadius.space_xl),
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomElevatedButton(
                onTap: state is SignUpLoading
                    ? null
                    : () => context.read<SignUpCubit>().preSignUp(),
                icon: Icons.arrow_forward_ios,
                text: AppLocalizations.of(context)!.getVerificationCode,
              );
            },
          ),
        ),
        body: SafeArea(
          child: ContactInfoBody(
            emailController: _emailController,
            phoneController: _phoneController,
          ),
        ),
      ),
    );
  }
}