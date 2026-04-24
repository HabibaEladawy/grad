
import 'package:dana_graduation_project/core/api/api_constant.dart';
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
import '../../features/books/data/datasource/Book_RemoteDataSource_Impl.dart';
import '../../features/books/data/datasource/Book_Remote_DataSource.dart';
import '../../features/books/data/repo/Book_RepositoryImpl.dart';
import '../../features/books/domain/repo/Book_Repository.dart';
import '../../features/books/presentation/cubit/books_cubit.dart';
import '../../features/home/data/datasource/Parent_Remote_DataSource_Impl.dart';
import '../../features/home/data/datasource/doctor_repository_impl.dart';
import '../../features/home/data/repo/Parent_Remote_DataSource.dart';
import '../../features/home/data/repo/doctor_remote_data_source.dart';
import '../../features/home/domain/repo/doctor_repository.dart';
import '../../features/home/domain/repo/parent_repository.dart';
import '../../features/home/domain/usecase/get_all_doctors_usecase.dart';
import '../../features/home/domain/usecase/get_doctor_by_id_usecase.dart';
import '../../features/home/domain/usecase/get_parent_profile_usecase.dart';
import '../../features/home/presentation/cubit/doctor_cubit.dart';
import '../../features/home/presentation/cubit/get_parent_profile_cubit.dart';
import '../../features/videos/data/datasource/Video_Remote_DataSource_Impl.dart';
import '../../features/videos/data/datasource/Video_Repository_Impl.dart';
import '../../features/videos/data/repo/VideoRepositoryImpl.dart';
import '../../features/videos/domain/repo/Video_Repository.dart';
import '../../features/videos/domain/usecase/Get_All_Videos_UseCase.dart';
import '../../features/videos/domain/usecase/Get_Video_By_Id.dart';
import '../../features/videos/domain/usecase/Search_VideosUseCase.dart';
import '../../features/videos/presentation/cubit/video_cubit.dart';
import '../api/api_manger.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core
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

  sl.registerLazySingleton<ApiManger>(
        () => ApiManger(sl()),
  );

  sl.registerLazySingleton(() => InternetConnection());

  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(sl()),
  );

  // Data Sources


  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<ParentRemoteDataSource>(
        () => ParentRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<DoctorRemoteDataSource>(
        () => DoctorRemoteDataSourceImpl(apiManager: sl()),
  );

  sl.registerLazySingleton<VideoRemoteDataSource>(
        () => VideoRemoteDataSourceImpl(
      apiManger: sl(),
    ),
  );

  //  BOOKS MODULE


  sl.registerLazySingleton<BooksRemoteDataSource>(
        () => BooksRemoteDataSourceImpl(sl<ApiManger>()),
  );

  sl.registerLazySingleton<BookRepository>(
        () => BooksRepoImpl(sl<BooksRemoteDataSource>()),
  );

  // Repositories

  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<ParentRepository>(
        () => ParentRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<DoctorRepository>(
        () => DoctorRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<VideoRepository>(
        () => VideoRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // UseCases

  sl.registerLazySingleton(() => PreSignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifySignUpUseCase(repository: sl()));
  sl.registerLazySingleton(() => PreSignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifySignInUseCase(repository: sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => VerifyPasswordOtpUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => CreateDoctorUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetParentProfileUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllDoctorsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetDoctorByIdUseCase(repository: sl()));

  sl.registerLazySingleton<GetAllVideosUseCase>(
        () => GetAllVideosUseCase(sl()),
  );

  sl.registerLazySingleton<SearchVideosUseCase>(
        () => SearchVideosUseCase(sl()),
  );

  sl.registerLazySingleton<GetVideoByIdUseCase>(
        () => GetVideoByIdUseCase(sl()),
  );

  // Cubits

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

  sl.registerFactory(
        () => ParentCubit(
      getParentProfileUseCase: sl(),
    ),
  );

  sl.registerFactory(
        () => DoctorCubit(
      getAllDoctorsUseCase: sl(),
      getDoctorByIdUseCase: sl(),
    ),
  );

  sl.registerFactory<VideoCubit>(
        () => VideoCubit(
      getAllVideosUseCase: sl(),
      getVideoByIdUseCase: sl(),
      searchVideosUseCase: sl(),
    ),
  );


  //  BOOK CUBIT

  sl.registerFactory<BookCubit>(
        () => BookCubit(sl<BookRepository>()),
  );
}