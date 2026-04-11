import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../../core/constant/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/user_model.dart';

// ── Child data class used in pre-signUp ──────────────────────────────────────
class ChildData {
  final String childName;
  final String gender; // "male" | "female"
  final String birthDate; // YYYY-MM-DD

  const ChildData({
    required this.childName,
    required this.gender,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() => {
    'childName': childName,
    'gender': gender,
    'birthDate': birthDate,
  };
}

// ── Abstract ──────────────────────────────────────────────────────────────────
abstract class AuthRemoteDataSource {
  /// Step 1 – Register parent + children (OTP sent to email for now)
  Future<void> preSignUp({
    required String parentName,
    required String email,
    required String phone,
    required String government,
    required String address,
    required String password,
    required List<ChildData> children,
    File? profileImage,
  });

  /// Step 2 – Verify sign-up OTP
  Future<void> verifySignUp({
    required String phone,
    required String otp,
  });

  /// Step 3 – Pre sign-in (sends OTP)
  Future<void> preSignIn({
    required String phone,
    required String password,
  });

  /// Step 4 – Verify sign-in OTP → returns token
  Future<UserModel> verifySignIn({
    required String phone,
    required String otp,
  });

  /// Forgot password – sends OTP to phone
  Future<void> resetPassword({required String phone});

  /// Verify reset-password OTP
  Future<void> verifyPasswordOtp({
    required String phone,
    required String otp,
  });

  /// Change password (authenticated)
  Future<void> changePassword({
    required String phone,
    required String password,
    required String token,
  });

  // ── Doctor endpoints ────────────────────────────────────────────────────────

  /// Create doctor (admin-level, multipart)
  Future<void> createDoctor({
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
  });
}
