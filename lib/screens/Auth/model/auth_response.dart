import 'user_model.dart';

class AuthResponse {
  final String message;
  final UserModel user;
  final String token;

  AuthResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      message: json["message"] ?? "",
      user: UserModel.fromJson(json["user"]),
      token: json["token"] ?? "",
    );
  }
}
