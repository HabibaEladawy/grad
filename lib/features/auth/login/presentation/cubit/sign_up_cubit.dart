import 'dart:io';
import 'package:dana_graduation_project/features/auth/login/presentation/cubit/sign_up_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import '../../domain/usecases/pre_sign_up_usecase.dart';
import '../../domain/usecases/verify_sign_up_usecase.dart';

// ── Cubit ─────────────────────────────────────────────────────────────────────
class SignUpCubit extends Cubit<SignUpState> {
  final PreSignUpUseCase preSignUpUseCase;
  final VerifySignUpUseCase verifySignUpUseCase;

  SignUpCubit({
    required this.preSignUpUseCase,
    required this.verifySignUpUseCase,
  }) : super(const SignUpInitial());

  /// Step 1 – إرسال بيانات الأب والأطفال
  Future<void> preSignUp({
    required String parentName,
    required String email,
    required String phone,
    required String government,
    required String address,
    required String password,
    required List<ChildData> children,
    File? profileImage,
  }) async {
    emit(const SignUpLoading());
    final result = await preSignUpUseCase(
      PreSignUpParams(
        parentName: parentName,
        email: email,
        phone: phone,
        government: government,
        address: address,
        password: password,
        children: children,
        profileImage: profileImage,
      ),
    );
    result.fold(
          (f) => emit(SignUpFailure(message: f.message)),
          (_) => emit(SignUpOtpSent(phone: phone)),
    );
  }

  /// Step 2 – تأكيد OTP
  Future<void> verifySignUp({
    required String phone,
    required String otp,
  }) async {
    emit(const SignUpLoading());
    final result = await verifySignUpUseCase(
      VerifySignUpParams(phone: phone, otp: otp),
    );
    result.fold(
          (f) => emit(SignUpFailure(message: f.message)),
          (_) => emit(const SignUpVerified()),
    );
  }
}