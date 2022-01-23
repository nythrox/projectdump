import 'equipamento_dto.dart';

abstract class EquipamentoRepository {
  Future<void> create(EquipamentoDto equipamentoDto);
  Future<EquipamentoDto> findById(int id);
  Future<void> delete(int id);
  Future<List<EquipamentoDto>> findAll();
}
