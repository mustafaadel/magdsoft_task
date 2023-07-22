class LoginResponse {
  final int status;
  final String code;
  final String message;

  LoginResponse(
      {required this.status, required this.message, required this.code});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      code: json['code'] as String,
    );
  }
}
