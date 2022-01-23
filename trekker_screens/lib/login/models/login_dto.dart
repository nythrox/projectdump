class LoginDto {
  final String email;
  final String password;

  LoginDto({
    this.email,
    this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) => LoginDto(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
