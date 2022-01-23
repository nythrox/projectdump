import 'dart:convert';

import 'package:trekkers/login/models/login_dto.dart';
import 'package:trekkers/login/models/login_response.dart';
import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

abstract class IUserRepository {
  Future<LoginResponse> login(LoginDto loginDto);
  Future<UserResponse> findCurrentUser();
  Future<void> signUp(SignUpDto signUpDto);
}

class UserRepository implements IUserRepository {
  final CustomDio _customDio;

  UserRepository(this._customDio);

  @override
  Future<UserResponse> findCurrentUser() async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl + "auth/me"}",
      );
      print(response.data);

      return UserResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}auth/login",
        data: jsonEncode(loginDto),
      );

      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }


   @override
  Future<void> signUp(SignUpDto signUpDto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}users_app/create",
        data: jsonEncode(signUpDto),
      );



      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> update(UpdateUserDto updateUserDto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}users/${updateUserDto.userId}",
        data: jsonEncode(updateUserDto),
      );
      return response.data;
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}


class UserResponse {
  UserDto userDto;

  UserResponse.fromJson(Map<String, dynamic> json) {
    userDto = UserDto.fromJson(json);
  }
}

class UserDto {
  int id;
  String name;
  String avatar;
  String role;
  String email;
  DateTime emailVerifiedAt;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  UserDto(
      {this.id,
      this.name,
      this.avatar,
      this.role,
      this.email,
      this.emailVerifiedAt,
      this.status,
      this.createdAt,
      this.updatedAt});

  UserDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    role = json['role'];
    email = json['email'];
    emailVerifiedAt = json["email_verified_at"] != null
        ? DateTime.parse(json['email_verified_at'])
        : null;
    status = json['status'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['created_at']);
  }
}

/*
class SignUpDto {
  final String name;
  final String phone;
  final String email;
  final String password;

  SignUpDto({this.name, this.phone, this.email, this.password});

  Map<String, dynamic> toJson() =>
      {"name": name, "phone": phone, "email": email, "password": password};
}
*/

class SignUpDto {
  String name;
  String email;
  String password;
  String cellPhone;
  String role;
  String sex;
  String avatar;
  int status;

  SignUpDto(
      {this.name,
      this.email,
      this.password,
      this.cellPhone,
      this.role,
      this.sex,
      this.avatar,
      this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cell_phone'] = this.cellPhone;
    data['role'] = this.role;
    data['sex'] = this.sex;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    return data;
  }
}



class UpdateUserDto {
  int userId;
  String name;
  String phone;
  int cityId;

  UpdateUserDto({this.name, this.phone, this.cityId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['city_id'] = this.cityId;
    return data;
  }
}
