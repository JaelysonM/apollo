class LoginDto {
  final String email;
  final String password;
  final bool company;

  LoginDto({
    required this.email,
    required this.password,
    this.company = false,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json, bool company) =>
      LoginDto(
        email: json["email"],
        password: json["password"],
        company: company,
      );
}
