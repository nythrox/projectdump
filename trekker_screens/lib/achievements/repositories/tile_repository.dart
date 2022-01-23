import 'package:dio/dio.dart';
import 'package:trekkers/achievements/models/medal.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class TileRepository{
  final CustomDio _customDio;
  final String baseUrl = "game/tiles/"; 

  TileRepository(this._customDio);


  //TODO:
  Future<List<dynamic>> getTilesFromUserId(int id) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + baseUrl + id.toString(),
      );
      List<dynamic> tiles = response.data["tiles"];
      return tiles;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  
  Future<dynamic> getTileById(int userId, tileId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + baseUrl + userId.toString() + "/" + tileId.toString(),
      );
      var tile = response.data["tiles"];
      return tile;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}