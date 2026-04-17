class ErrorModel {
  final int statusCode;
  final String message;

  const ErrorModel({
    required this.statusCode,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );
  }
}