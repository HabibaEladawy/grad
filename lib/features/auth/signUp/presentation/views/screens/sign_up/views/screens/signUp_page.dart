import 'package:dana_graduation_project/core/di/injection_container.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../../providers/app_theme_provider.dart';
import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../../../../../../../login/presentation/cubit/sign_up_state.dart';
import '../widgets/sign_up_indicator_row.dart';
import '../widgets/sign_up_page_view.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = 'SignUpPage';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentIndex < 3) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return BlocProvider(
      create: (_) => sl<SignUpCubit>(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
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
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: AppSizes.h24),
                SignUpIndicatorRow(currentIndex: _currentIndex),
                Expanded(
                  child: SignUpPageView(
                    controller: _controller,
                    onPageChanged: _onPageChanged,
                    onNext: _goToNextPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}