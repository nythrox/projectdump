import 'package:trekkers/shared/utils/store.dart';
import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  final Store<String> _store;

  AuthorizationInterceptor(this._store);

  @override
  Future onRequest(RequestOptions options) async {
    if (!options.path.contains("login")) {
      final token = await _store.read("token");
/*
Verifying and refresh token
      var jws = JsonWebSignature.fromCompactSerialization(token);
      final payload = jws.unverifiedPayload.jsonContent;

      final expiration = DateTime.fromMicrosecondsSinceEpoch(payload["exp"]);

      if (expiration.isBefore(DateTime.now())) {
        final response = await Dio().post(
          "https://trekkers.sevenclicks.us/api/auth/refresh",
          options: Options(
            headers: <String, dynamic>{"Authorization": "Bearer $token"},
          ),
        );
      }
*/
      return options..headers["Authorization"] = "Bearer $token";
    }
    return options;
  }
}
