import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../../../../core/auth/auth_session.dart';
import '../../../../../../../../../core/di/injection_container.dart';
import '../../../../../../../../../core/utils/app_routes.dart';
import '../../../../../../../login/presentation/cubit/google_auth_cubit.dart';
import '../../../../../../../login/presentation/cubit/google_auth_state.dart';
import '../../../../../../../login/presentation/cubit/sign_up_cubit.dart';
import '../../../../../../../login/presentation/cubit/sign_up_state.dart';

class SignUpListeners extends StatelessWidget {
  final Widget child;

  const SignUpListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) async {
            if (state is SignUpVerified) {
              await sl<AuthSession>().setToken(state.token);

              if (!context.mounted) return;

              Navigator.pushReplacementNamed(
                context,
                AppRoutes.home,
              );
            }
          },
        ),

        BlocListener<GoogleAuthCubit, GoogleAuthState>(
          listener: (context, state) async {
            if (state is GoogleAuthLaunchUrl) {
              await launchUrl(
                Uri.parse(state.url),
                mode: LaunchMode.externalApplication,
              );

              if (!context.mounted) return;

              Navigator.pushNamed(
                context,
                AppRoutes.googleRequestId,
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}