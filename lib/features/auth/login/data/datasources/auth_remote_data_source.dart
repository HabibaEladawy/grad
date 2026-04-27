
import 'dart:io';
import '../model/user_model.dart';

class ChildData {
  final String childName;
  final String gender;
  final String birthDate;

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

abstract class AuthRemoteDataSource {
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

  Future<String> verifySignUp({required String phone, required String otp});

  Future<void> addPassword({required String password});

  Future<void> preSignIn({required String phone, required String password});

  Future<UserModel> verifySignIn({required String phone, required String otp});

  Future<void> resetPassword({required String phone});

  Future<String> verifyPasswordOtp({required String phone, required String otp});

  Future<void> changePassword({
    required String phone,
    required String password,
    required String token,
  });


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

  Future<dynamic> googleSignIn();

  Future<UserModel> googleComplete({
    required String requestId,
    required String phone,
    required String password,
    required String government,
    required String address,
    required List<ChildData> children,
  });
}
