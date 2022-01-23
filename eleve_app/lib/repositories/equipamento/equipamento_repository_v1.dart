import 'package:eleve_app/repositories/equipamento/equipamento_dto.dart';
import 'package:eleve_app/repositories/equipamento/equipamento_repository.dart';
import '../../custom_dio.dart';

class EquipamentoRepositoryV1 extends EquipamentoRepository {
  final CustomDio customDio;

  EquipamentoRepositoryV1(this.customDio);
  @override
  Future<void> create(EquipamentoDto equipamentoDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "equipamento",
          data: equipamentoDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .delete(dio.options.baseUrl + "equipamento/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EquipamentoDto> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res =
          await dio.get(dio.options.baseUrl + "equipamento/" + id.toString());
      return EquipamentoDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
