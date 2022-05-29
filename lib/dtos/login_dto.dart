class LoginDto {
  final String email;
  final String password;

  LoginDto({
    required this.email,
    required this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        email: json["email"],
        password: json["password"],
      );
}
