import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_in_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/pre_sign_in_usecase.dart';
import '../../domain/usecases/verify_sign_in_usecase.dart';


// ── Cubit ─────────────────────────────────────────────────────────────────────
class SignInCubit extends Cubit<SignInState> {
  final PreSignInUseCase preSignInUseCase;
  final VerifySignInUseCase verifySignInUseCase;

  SignInCubit({
    required this.preSignInUseCase,
    required this.verifySignInUseCase,
  }) : super(const SignInInitial());

  /// Step 1 – إرسال رقم الهاتف وكلمة المرور
  Future<void> preSignIn({
    required String phone,
    required String password,
  }) async {
    emit(const SignInLoading());
    final result = await preSignInUseCase(
      PreSignInParams(phone: phone, password: password),
    );
    result.fold(
          (f) => emit(SignInFailure(message: f.message)),
          (_) => emit(SignInOtpSent(phone: phone)),
    );
  }

  /// Step 2 – تأكيد OTP والحصول على التوكن
  Future<void> verifySignIn({
    required String phone,
    required String otp,
  }) async {
    emit(const SignInLoading());
    final result = await verifySignInUseCase(
      VerifySignInParams(phone: phone, otp: otp),
    );
    result.fold(
          (f) => emit(SignInFailure(message: f.message)),
          (user) => emit(SignInSuccess(user: user)),
    );
  }
}