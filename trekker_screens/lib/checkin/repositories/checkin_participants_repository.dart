import 'package:dio/dio.dart';
import 'package:trekkers/events/models/lote.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class CheckinParticipantsRepository{
  final CustomDio _customDio;
  final String baseUrl = "event-participants/"; 

  CheckinParticipantsRepository(this._customDio);

  Future<List<Lote>> getEventLotes(int id) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + baseUrl + id.toString(),
      );
      List<Lote> lotes = response.data.users.map((lote)=>Lote.fromJson(lote)).toList();
      return lotes;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}