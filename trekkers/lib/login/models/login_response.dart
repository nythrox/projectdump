import 'package:trekkers/shared/models/token_dto.dart';

class LoginResponse {
  TokenDto token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = TokenDto.fromJson(json);
  }
}
