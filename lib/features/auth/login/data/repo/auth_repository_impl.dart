import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repo/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // ── helper ──────────────────────────────────────────────────────────────────
  Future<Either<Failure, T>> _guard<T>(Future<T> Function() call) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: 'لا يوجد اتصال بالإنترنت'));
    }
    try {
      return Right(await call());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return const Left(UnknownFailure(message: 'حدث خطأ غير متوقع'));
    }
  }

  // ── Sign Up ──────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> preSignUp({
    required String parentName,
    required String email,
    required String phone,
    required String government,
    required String address,
    required String password,
    required List<ChildData> children,
    File? profileImage,
  }) =>
      _guard(() async {
        await remoteDataSource.preSignUp(
          parentName: parentName,
          email: email,
          phone: phone,
          government: government,
          address: address,
          password: password,
          children: children,
          profileImage: profileImage,
        );
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> verifySignUp({
    required String phone,
    required String otp,
  }) =>
      _guard(() async {
        await remoteDataSource.verifySignUp(phone: phone, otp: otp);
        return unit;
      });

  // ── Sign In ──────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> preSignIn({
    required String phone,
    required String password,
  }) =>
      _guard(() async {
        await remoteDataSource.preSignIn(phone: phone, password: password);
        return unit;
      });

  @override
  Future<Either<Failure, UserEntity>> verifySignIn({
    required String phone,
    required String otp,
  }) =>
      _guard(() => remoteDataSource.verifySignIn(phone: phone, otp: otp));

  // ── Reset Password ───────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> resetPassword({required String phone}) =>
      _guard(() async {
        await remoteDataSource.resetPassword(phone: phone);
        return unit;
      });

  @override
  Future<Either<Failure, Unit>> verifyPasswordOtp({
    required String phone,
    required String otp,
  }) =>
      _guard(() async {
        await remoteDataSource.verifyPasswordOtp(phone: phone, otp: otp);
        return unit;
      });

  // ── Change Password ──────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String phone,
    required String password,
    required String token,
  }) =>
      _guard(() async {
        await remoteDataSource.changePassword(
            phone: phone, password: password, token: token);
        return unit;
      });

  // ── Doctor ───────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Unit>> createDoctor({
    required String doctorName,
    required String email,
    required String phone,
    required String password,
    required int detectionPrice,
    required int expires,
    required String specialty,
    required List<String> availableDates,
    required List<String> availableTimes,
    File? profileImage,
  }) =>
      _guard(() async {
        await remoteDataSource.createDoctor(
          doctorName: doctorName,
          email: email,
          phone: phone,
          password: password,
          detectionPrice: detectionPrice,
          expires: expires,
          specialty: specialty,
          availableDates: availableDates,
          availableTimes: availableTimes,
          profileImage: profileImage,
        );
        return unit;
      });
}