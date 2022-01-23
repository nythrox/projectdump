import 'package:eleve_app/repositories/cliente/cliente_dto.dart';

import '../../custom_dio.dart';
import 'cliente_repository.dart';

class ClienteRepositoryV1 implements ClienteRepository {
  final CustomDio customDio;

  ClienteRepositoryV1(this.customDio);
  @override
  Future<void> delete(int id) async{
    try {
      final dio = customDio.dio;
      final res = await dio.delete(dio.options.baseUrl + "clientes/"+id.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ClienteDto>> findAll() async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl + "clientes");
      return clienteDtoFromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ClienteDto> findById(int id) async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl + "clientes/"+id.toString());
      return ClienteDto.fromJson(res.data);
    } catch (e) {
      rethrow;
    }}
}
