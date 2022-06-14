class RegisterDto {
  final String email;
  final String password;
  final String first_name;
  final String last_name;
  final bool company;

  RegisterDto({
    required this.email,
    required this.password,
    required this.first_name,
    required this.last_name,
    this.company = false,
  });

  factory RegisterDto.fromJson(Map<String, dynamic> json, bool company) =>
      RegisterDto(
        email: json["email"],
        password: json["password"],
        first_name: json["name"].split(" ")[0],
        last_name: company ? "" : json["name"].split(" ")[1],
        company: company,
      );
}
