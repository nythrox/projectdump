import 'package:eleve_app/repositories/equipamento-cliente/equipamento_cliente_dto.dart';

abstract class EquipamentoClienteRepository {
  Future<void> create(EquipamentoClienteDto equipamentoClienteDto);
  Future<EquipamentoClienteDto> findById(int id);
  Future<void> delete(int id);
}
