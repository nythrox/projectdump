import '../custom_dio.dart';
import 'equipamento_dto.dart';
import 'equipamento_repository.dart';

class EquipamentoRepositoryV1 extends EquipamentoRepository {
  final CustomDio customDio;

  EquipamentoRepositoryV1(this.customDio);
  @override
  Future<void> create(EquipamentoDto equipamentoDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "equipamentos",
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
          .delete(dio.options.baseUrl + "equipamentos/" + id.toString());
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
          await dio.get(dio.options.baseUrl + "equipamentos/" + id.toString());
      return EquipamentoDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EquipamentoDto>> findAll() async {
    try {
      // final dio = customDio.dio;
      // final res = await dio.get(dio.options.baseUrl + "equipamentos/");
      // return equipamentoDtoFromJson(res.data);
      return [EquipamentoDto(ativo: true,descricao: "aaaa", fabricante: "aaaa", tipo: Tipo(descricao: "asdasdd") )];
    } catch (e) {
      rethrow;
    }
  }
}
