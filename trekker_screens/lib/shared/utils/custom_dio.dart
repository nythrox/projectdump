import 'package:trekkers/shared/utils/interceptors.dart';
import 'package:trekkers/shared/utils/store.dart';
import 'package:dio/dio.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://trekkers.sevenclicks.us/api/",
    ));

    _dio.interceptors.add(
      AuthorizationInterceptor(
        SharedPreferencesTokenStore(),
      ),
    );
  }

  Dio get dio => _dio;
}
