import 'package:dio/dio.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/statics/models/relatorio-trilha.dart';

class TrailsRepository {
  final CustomDio _customDio;

  final String baseUrl = "/trails";

  TrailsRepository(this._customDio);

  Future<RelatorioTrilha> getTrailStatistics(int id) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}" + baseUrl + id.toString(),
      );
      return RelatorioTrilha.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
