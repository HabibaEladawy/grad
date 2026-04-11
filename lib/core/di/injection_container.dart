// lib/core/di/injection_container.dart
// ignore_for_file: cascade_invocations

import 'package:dana_graduation_project/core/api/api_constant.dart';
import 'package:dana_graduation_project/core/api/api_manger.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/auth/login/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/login/data/datasources/auth_remote_data_source_impl.dart';
import '../../features/auth/login/data/repo/auth_repository_impl.dart';
import '../../features/auth/login/domain/repo/auth_repository.dart';
import '../../features/auth/login/domain/usecases/change_password_usecase.dart';
import '../../features/auth/login/domain/usecases/create_doctor_usecase.dart';
import '../../features/auth/login/domain/usecases/pre_sign_in_usecase.dart';
import '../../features/auth/login/domain/usecases/pre_sign_up_usecase.dart';
import '../../features/auth/login/domain/usecases/reset_password_usecase.dart';
import '../../features/auth/login/domain/usecases/verify_password_otp_usecase.dart';
import '../../features/auth/login/domain/usecases/verify_sign_in_usecase.dart';
import '../../features/auth/login/domain/usecases/verify_sign_up_usecase.dart';
import '../../features/auth/login/presentation/cubit/change_password_cubit.dart';
import '../../features/auth/login/presentation/cubit/create_doctor_cubit.dart';
import '../../features/auth/login/presentation/cubit/reset_password_cubit.dart';
import '../../features/auth/login/presentation/cubit/sign_in_cubit.dart';
import '../../features/auth/login/presentation/cubit/sign_up_cubit.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // ══════════════════════════════════════════════════════════════════════════
  //  Cubits
  // ══════════════════════════════════════════════════════════════════════════

  sl.registerFactory(
        () => SignUpCubit(
      preSignUpUseCase: sl(),
      verifySignUpUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => SignInCubit(
      preSignInUseCase: sl(),
      verifySignInUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => ResetPasswordCubit(
      resetPasswordUseCase: sl(),
      verifyPasswordOtpUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => ChangePasswordCubit(
      changePasswordUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => CreateDoctorCubit(
      createDoctorUseCase: sl(),
    ),
  );

  // ══════════════════════════════════════════════════════════════════════════
  //  Use Cases
  // ══════════════════════════════════════════════════════════════════════════

  sl.registerLazySingleton(() => PreSignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifySignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => PreSignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifySignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifyPasswordOtpUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateDoctorUseCase(repository: sl()));

  // ══════════════════════════════════════════════════════════════════════════
  //  Repository
  // ══════════════════════════════════════════════════════════════════════════

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // ══════════════════════════════════════════════════════════════════════════
  //  Data Sources
  // ══════════════════════════════════════════════════════════════════════════

  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl()),
  );

  // ══════════════════════════════════════════════════════════════════════════
  //  Core
  // ══════════════════════════════════════════════════════════════════════════

  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(
        () => InternetConnection(),
  );

  sl.registerLazySingleton<Dio>(
        () => Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/json'},
      ),
    ),
  );
}
