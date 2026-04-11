import 'package:dana_graduation_project/core/constant/custom_buttom.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../../../../../../../login/presentation/cubit/sign_up_state.dart';
import '../widgets/create_password_body.dart';

class CreatePasswordScreen extends StatefulWidget {
  static const String routeName = 'CreatePasswordScreen';
  final VoidCallback? onNext;
  const CreatePasswordScreen({super.key, this.onNext});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
            () => context.read<SignUpCubit>().updatePassword(_passwordController.text));
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onCreateAccount() {
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (password != confirm) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('كلمتا المرور غير متطابقتين'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // الـ password اتحفظ في الـ cubit عن طريق الـ listener
    // هنا نعمل verifySignUp لو عندنا OTP أو نروح للـ login
    // في الـ flow ده الـ OTP اتتأكد قبل كده في ContactInfoScreen
    // فبس نروح للـ login
    Navigator.pushNamedAndRemoveUntil(
      context,
      'LoginPage',
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpVerified) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            'LoginPage',
                (route) => false,
          );
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(AppRadius.radius_xl),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocBuilder<SignUpCubit, SignUpState>(
              builder: (context, state) {
                final isLoading = state is SignUpLoading;
                return CustomButton(
                  onTap: isLoading ? () {} : _onCreateAccount,
                  color: isLoading
                      ? AppColors.primary_default_light.withOpacity(0.5)
                      : AppColors.primary_default_light,
                  text: AppText.createAccount,
                );
              },
            ),
          ),
        ),
        body: SafeArea(
          child: CreatePasswordBody(
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
          ),
        ),
      ),
    );
  }
}