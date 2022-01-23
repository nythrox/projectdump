import 'package:eleve_app/repositories/cliente-contrato/cliente_contrato_dto.dart';

import '../../custom_dio.dart';
import 'cliente_contrato_repository.dart';

class ClienteContratoRepositoryV1 implements ClienteContratoRepository {
  final CustomDio customDio;

  ClienteContratoRepositoryV1(this.customDio);

  @override
  Future<void> delete(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .delete(dio.options.baseUrl + "cliente-contrato/" + id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClienteContratoDto> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio
          .delete(dio.options.baseUrl + "cliente-contrato/" + id.toString());
      return ClienteContratoDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create(ClienteContratoDto clienteContratoDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(dio.options.baseUrl + "cliente-contrato",
          data: clienteContratoDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
