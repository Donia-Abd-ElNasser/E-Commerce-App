class AuthModel {
  final String token;
  final String name;
  final String email;

  AuthModel({
    required this.token,
    required this.name,
    required this.email,
  });

  factory AuthModel.fromJson(json) {
    return AuthModel(
      token: json["token"] ?? "",
      name: json["user"]["name"] ?? "",
      email: json["user"]["email"] ?? "",
    );
  }
}
