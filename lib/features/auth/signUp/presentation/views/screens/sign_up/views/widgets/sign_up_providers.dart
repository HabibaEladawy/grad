import 'package:dana/features/auth/signUp/presentation/views/screens/sign_up/views/widgets/sign_up_listeners.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../login/presentation/cubit/google_auth_cubit.dart';
import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';

class SignUpProviders extends StatelessWidget {
  final Widget child;
  final SignUpCubit cubit;
  final GoogleAuthCubit googleCubit;

  const SignUpProviders({
    super.key,
    required this.child,
    required this.cubit,
    required this.googleCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider.value(value: googleCubit),
      ],
      child: SignUpListeners(child: child),
    );
  }
}