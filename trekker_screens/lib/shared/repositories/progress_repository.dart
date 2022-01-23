import 'package:dio/dio.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class ProgressRepository  {
  final CustomDio _customDio;
  final String baseUrl = "progress/";
  ProgressRepository(this._customDio);

  Future<String> getUserProgress(int id) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}" + baseUrl + id.toString(),
      );
      return response.data;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
