class ErrorModel {
  final int status;
  final String message;

  const ErrorModel({
    required this.status,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json['response']['status'],
      message: json['response']['message'],
    );
  }
}