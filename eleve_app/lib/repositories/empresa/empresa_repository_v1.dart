import 'package:eleve_app/custom_dio.dart';
import 'package:eleve_app/repositories/empresa/empresa_dto.dart';

import 'empresa_repository.dart';

class EmpresaRepostoryV1 implements EmpresaRepository{
  final CustomDio customDio;

  EmpresaRepostoryV1(this.customDio);

  Future<List<EmpresaDto>> findAll() async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl + "empresa");
      return empresaDtoFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<EmpresaDto> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res =
          await dio.get(dio.options.baseUrl + "empresa/" + id.toString());
      return EmpresaDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> create(EmpresaDto createEmpresaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "empresa/",
          data: createEmpresaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res =
          await dio.delete(dio.options.baseUrl + "empresa/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(EmpresaDto updateEmpresaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.patch(dio.options.baseUrl + "empresa/",
          data: updateEmpresaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EmpresaDto>> findAllByPage(
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
          .get(dio.options.baseUrl + "empresa/page", queryParameters: {
        "offset": offfset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "paged": paged,
        "unpaged": unpaged,
        "sorted": sorted,
        "unsorted": unsorted
      });
      return empresaDtoFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
