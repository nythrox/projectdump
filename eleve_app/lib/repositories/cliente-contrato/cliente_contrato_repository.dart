import 'package:eleve_app/repositories/cliente-contrato/cliente_contrato_dto.dart';

abstract class ClienteContratoRepository {
  Future<ClienteContratoDto> findById(int id);
  Future<void> create(ClienteContratoDto clienteContratoDto);
  Future<void> delete(int id);
}
