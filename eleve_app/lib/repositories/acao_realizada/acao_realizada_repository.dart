import 'package:dio/dio.dart';
import 'package:eleve_app/custom_dio.dart';
import 'package:eleve_app/repositories/acao_realizada/acao_realizada_model.dart';

class AcaoRealizadaRepository {
  final CustomDio customDio;

  AcaoRealizadaRepository(this.customDio);

  Future<List<AcaoRealizadaModel>> findAll() async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl + "acao-realizada");
      return acaoRealizadaModelFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AcaoRealizadaModel> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .get(dio.options.baseUrl + "acao-realizada/" + id.toString());
      return AcaoRealizadaModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create(dynamic createAcaoRealizadaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "acao-realizada/",
          data: createAcaoRealizadaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .delete(dio.options.baseUrl + "acao-realizada/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(dynamic updateAcaoRealizadaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.patch(dio.options.baseUrl + "acao-realizada/",
          data: updateAcaoRealizadaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AcaoRealizadaModel>> findAllByPage(
      {int offfset,
      int pageNumber,
      int pageSize,
      bool paged,
      bool unpaged,
      bool sorted,
      bool unsorted}) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .get(dio.options.baseUrl + "acao-realizada/page", queryParameters: {
        "offset": offfset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "paged": paged,
        "unpaged": unpaged,
        "sorted": sorted,
        "unsorted": unsorted
      });
      return acaoRealizadaModelFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
