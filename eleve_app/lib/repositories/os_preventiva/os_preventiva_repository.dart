import 'package:dio/dio.dart';
import 'package:eleve_app/custom_dio.dart';
import 'package:eleve_app/repositories/os_preventiva/criar_os_preventiva.dto.dart';
import 'package:eleve_app/repositories/os_preventiva/enviar_item_formulario_dto.dart';

class OsPreventivaRepository {
  final CustomDio customDio;

  OsPreventivaRepository(this.customDio);

  Future<void> abrirPreventiva(
      CriarOsPreventivaDto criarOsPreventivaDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(
          dio.options.baseUrl + "os-preventiva/abrir-preventiva",
          data: criarOsPreventivaDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> enviarItemFormulario(
      EnviarItemFormularioDto enviarItemFormularioDto) async {
    try {
      final dio = customDio.dio;
      final res = await dio.post(
          dio.options.baseUrl + "os-preventiva/envio-item-formulario",
          data: enviarItemFormularioDto);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> carregarFormularioPorTipo(int tipoId) async {
    try {
      final dio = customDio.dio;
      final res = await dio.get(dio.options.baseUrl +
          "os-preventiva/carregar-formulario/tipo/" +
          tipoId.toString());
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
