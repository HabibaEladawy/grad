import 'package:dartz/dartz.dart';

import 'package:dana_graduation_project/core/network/network_info.dart';
import 'package:dana_graduation_project/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:dana_graduation_project/features/booking/domain/entities/booking_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repo/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BookingRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  // ── helper ────────────────────────────────────────────────────────────────
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

  @override
  Future<Either<Failure, BookingEntity>> getBookingById(String id) =>
      _guard(() => remoteDataSource.getBookingById(id));

  @override
  Future<Either<Failure, List<BookingEntity>>> getMyAppointments(
      String parentId) =>
      _guard(() => remoteDataSource.getMyAppointments(parentId));

  @override
  Future<Either<Failure, BookingEntity>> createBooking({
    required String doctorId,
    required String parentId,
    required String childId,
    required String date,
    required String time,
    required String paymentMethod,
    required String visitStatus,
    required double detectionPrice,
    String? notes,
  }) =>
      _guard(() => remoteDataSource.createBooking(
        doctorId: doctorId,
        parentId: parentId,
        childId: childId,
        date: date,
        time: time,
        paymentMethod: paymentMethod,
        visitStatus: visitStatus,
        detectionPrice: detectionPrice,
        notes: notes,
      ));

  @override
  Future<Either<Failure, BookingEntity>> updateBooking({
    required String bookingId,
    required String date,
    required String time,
  }) =>
      _guard(() => remoteDataSource.updateBooking(
        bookingId: bookingId,
        date: date,
        time: time,
      ));

  @override
  Future<Either<Failure, BookingEntity>> deleteBooking(String id) =>
      _guard(() => remoteDataSource.deleteBooking(id));
}