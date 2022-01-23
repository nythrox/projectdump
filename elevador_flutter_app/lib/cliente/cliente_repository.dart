import 'cliente_dto.dart';

abstract class ClienteRepository {
  Future<List<ClienteDto>> findAll();
  Future<ClienteDto> findById(int id);
  Future<void> delete(int id);
}
