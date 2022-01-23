import 'package:eleve_app/custom_dio.dart';
import 'package:eleve_app/repositories/acao_realizada/acao_realizada_model.dart';
import 'package:eleve_app/repositories/ordem_servico/abertura_ordem_servico_dto.dart';
import 'package:eleve_app/repositories/ordem_servico/ordem_servico_model.dart';

class OrdemServicoRepository {
  final CustomDio customDio;

  OrdemServicoRepository(this.customDio);

  Future<List<OrdemServicoModel>> findAll() async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl + "ordemservico");
      return ordemServicoModelFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAbertura(
      AberturaOrdemServicoDto aberturaOrdemServicoDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "ordemservico/abriros",
          data: aberturaOrdemServicoDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<OrdemServicoModel> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res =
          await dio.get(dio.options.baseUrl + "ordemservico/" + id.toString());
      return OrdemServicoModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create(dynamic createEmpresaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "ordemservico/",
          data: createEmpresaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .delete(dio.options.baseUrl + "ordemservico/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(dynamic updateEmpresaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.patch(dio.options.baseUrl + "ordemservico/",
          data: updateEmpresaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<OrdemServicoModel>> findAllByPage(
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
          .get(dio.options.baseUrl + "ordemservico/page", queryParameters: {
        "offset": offfset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "paged": paged,
        "unpaged": unpaged,
        "sorted": sorted,
        "unsorted": unsorted
      });
      return ordemServicoModelFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
