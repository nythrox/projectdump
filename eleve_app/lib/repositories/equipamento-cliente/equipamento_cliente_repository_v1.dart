import 'package:eleve_app/repositories/equipamento-cliente/equipamento_cliente_dto.dart';
import 'package:eleve_app/repositories/equipamento-cliente/equipamento_cliente_repository.dart';

import '../../custom_dio.dart';

class EquipamentoClienteRepositoryV1 implements EquipamentoClienteRepository {
  final CustomDio customDio;

  EquipamentoClienteRepositoryV1(this.customDio);

  @override
  Future<void> create(EquipamentoClienteDto equipamentoClienteDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "equipamentos-cliente",
          data: equipamentoClienteDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio.delete(
          dio.options.baseUrl + "equipamentos-cliente/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EquipamentoClienteDto> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .get(dio.options.baseUrl + "equipamentos-cliente/" + id.toString());
      return EquipamentoClienteDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
