import 'package:eleve_app/repositories/empresa/empresa_dto.dart';

abstract class EmpresaRepository {
  Future<List<EmpresaDto>> findAll();

  Future<EmpresaDto> findById(int id);

  Future<void> create(EmpresaDto createEmpresaDto);
  Future<void> delete(int id);

  Future<void> update(EmpresaDto updateEmpresaDto);

  Future<List<EmpresaDto>> findAllByPage(
      {int offfset,
      int pageNumber,
      int pageSize,
      bool paged,
      bool unpaged,
      bool sorted,
      bool unsorted});
}
