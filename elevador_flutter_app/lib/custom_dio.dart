import 'package:dio/dio.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://api.eleve.app/v2/api/",
    ));
  }

  Dio get dio => _dio;
}
