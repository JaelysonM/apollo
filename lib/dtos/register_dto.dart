class RegisterDto {
  final String email;
  final String password;
  final String first_name;
  final String last_name;

  RegisterDto({
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json) => RegisterDto(
        email: json["email"],
        password: json["password"],
        first_name: json["name"].split(" ")[0],
        last_name: json["name"].split(" ")[1],
      );
}
