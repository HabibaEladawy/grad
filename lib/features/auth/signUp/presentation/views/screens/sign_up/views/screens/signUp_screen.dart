
import 'package:dana/core/di/injection_container.dart';

import 'package:dana/features/auth/login/presentation/cubit/sign_up_cubit.dart';
import 'package:dana/features/auth/login/presentation/cubit/google_auth_cubit.dart';

import 'package:flutter/material.dart';

import '../widgets/sign_up_providers.dart';
import '../widgets/sign_up_view.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'SignUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late final SignUpCubit _cubit;
  late final GoogleAuthCubit _googleCubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<SignUpCubit>();
    _googleCubit = sl<GoogleAuthCubit>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cubit.close();
    _googleCubit.close();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  void _goToNextPage() {
    final ok = switch (_currentIndex) {
      0 => _cubit.onStep1Next(),
      1 => _cubit.onStep2Next(),
      _ => true,
    };

    if (!ok) return;

    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignUpProviders(
      cubit: _cubit,
      googleCubit: _googleCubit,
      child: SignUpView(
        controller: _controller,
        currentIndex: _currentIndex,
        onPageChanged: _onPageChanged,
        onNext: _goToNextPage,
      ),
    );
  }
}