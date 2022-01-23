import 'package:dio/dio.dart';
import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class ForgotPasswordRepository {
  final String url = "auth/forgot";
  final CustomDio _customDio;

  ForgotPasswordRepository(this._customDio);

  Future<dynamic> resetPassword(String email) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl + url}",
        data: {
          "email": email
        }
      );
      print(response.data);
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