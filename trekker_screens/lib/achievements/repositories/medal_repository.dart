import 'package:dio/dio.dart';
import 'package:trekkers/achievements/models/medal.dart';
import 'package:trekkers/achievements/models/medal_details.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class MedalRepository{
  final CustomDio _customDio;
  final String baseUrl = "game/medals/"; 

  MedalRepository(this._customDio);

  Future<List<Medal>> getMedalsFromUserId(int userId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + baseUrl + userId.toString(),
      );
      List<Medal> medals = medalFromJson(response.data["medals"]);
      return medals;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<MedalDetails> getMedalById(int userId, medalId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + baseUrl + userId.toString() + "/" + medalId.toString(),
      );
      MedalDetails medal = MedalDetails.fromJson(response.data["medals"]);
      return medal;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}