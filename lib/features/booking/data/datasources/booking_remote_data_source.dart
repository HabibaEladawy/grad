import 'dart:convert';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../model/booking_model.dart';


abstract class BookingRemoteDataSource {
  /// GET /v1/booking/:id
  Future<BookingModel> getBookingById(String id);

  /// GET /v1/booking/myAppointment/:parentId
  Future<List<BookingModel>> getMyAppointments(String parentId);

  /// POST /v1/booking
  Future<BookingModel> createBooking({
    required String doctorId,
    required String parentId,
    required String childId,
    required String date,
    required String time,
    required String paymentMethod,
    required String visitStatus,
    required double detectionPrice,
    String? notes,
  });

  /// PATCH /v1/booking/:id
  Future<BookingModel> updateBooking({
    required String bookingId,
    required String date,
    required String time,
  });

  /// DELETE /v1/booking/:id
  Future<BookingModel> deleteBooking(String id);
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final Dio dio;

  BookingRemoteDataSourceImpl({required this.dio});

  // ── helpers ──────────────────────────────────────────────────────────────
  dynamic _decode(dynamic raw) => raw is String ? jsonDecode(raw) : raw;

  String? _extractMessage(dynamic data) {
    if (data is Map) {
      final msg = data['message'];
      if (msg != null) return msg.toString();
    }
    return null;
  }

  // ── endpoints ─────────────────────────────────────────────────────────────

  @override
  Future<BookingModel> getBookingById(String id) async {
    try {
      final response = await dio.get('/v1/booking/$id');
      final data = _decode(response.data);
      return BookingModel.fromJson(data['data']);
    } on DioException catch (e) {
      final data = _decode(e.response?.data);
      throw ServerException(message: _extractMessage(data) ?? 'فشل جلب الحجز');
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException(message: 'حدث خطأ غير متوقع');
    }
  }

  @override
  Future<List<BookingModel>> getMyAppointments(String parentId) async {
    try {
      final response = await dio.get('/v1/booking/myAppointment/$parentId');
      final data = _decode(response.data);
      final List list = data['data'] as List;
      return list.map((e) => BookingModel.fromJson(e)).toList();
    } on DioException catch (e) {
      final data = _decode(e.response?.data);
      throw ServerException(
          message: _extractMessage(data) ?? 'فشل جلب المواعيد');
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException(message: 'حدث خطأ غير متوقع');
    }
  }

  @override
  Future<BookingModel> createBooking({
    required String doctorId,
    required String parentId,
    required String childId,
    required String date,
    required String time,
    required String paymentMethod,
    required String visitStatus,
    required double detectionPrice,
    String? notes,
  }) async {
    try {
      final response = await dio.post(
        '/v1/booking',
        data: {
          'doctorId': doctorId,
          'parentId': parentId,
          'childId': childId,
          'date': date,
          'time': time,
          'paymentMethod': paymentMethod,
          'visitStatus': visitStatus,
          'detectionPrice': detectionPrice,
          if (notes != null) 'notes': notes,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final data = _decode(response.data);
      return BookingModel.fromJson(data['data']);
    } on DioException catch (e) {
      final data = _decode(e.response?.data);
      throw ServerException(
          message: _extractMessage(data) ?? 'فشل إنشاء الحجز');
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException(message: 'حدث خطأ غير متوقع');
    }
  }

  @override
  Future<BookingModel> updateBooking({
    required String bookingId,
    required String date,
    required String time,
  }) async {
    try {
      final response = await dio.patch(
        '/v1/booking/$bookingId',
        data: {'date': date, 'time': time},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      final data = _decode(response.data);
      return BookingModel.fromJson(data['data']);
    } on DioException catch (e) {
      final data = _decode(e.response?.data);
      throw ServerException(
          message: _extractMessage(data) ?? 'فشل تعديل الحجز');
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException(message: 'حدث خطأ غير متوقع');
    }
  }

  @override
  Future<BookingModel> deleteBooking(String id) async {
    try {
      final response = await dio.delete('/v1/booking/$id');
      final data = _decode(response.data);
      return BookingModel.fromJson(data['data']);
    } on DioException catch (e) {
      final data = _decode(e.response?.data);
      throw ServerException(
          message: _extractMessage(data) ?? 'فشل حذف الحجز');
    } catch (e) {
      if (e is ServerException) rethrow;
      throw const ServerException(message: 'حدث خطأ غير متوقع');
    }
  }
}