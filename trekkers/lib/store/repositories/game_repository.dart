import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/model/level.dart';
import 'package:trekkers/store/model/progress.dart';
import 'package:dio/dio.dart';

abstract class IGameRepository {
  Future<Progress> findProgressByUserId(int userId);
  Future<LevelResponse> findGameLevels();
}

class GameRepository implements IGameRepository {
  final CustomDio _customDio;

  GameRepository(this._customDio);

  @override
  Future<Progress> findProgressByUserId(int userId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}game/progress/$userId",
      );
      return Progress.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LevelResponse> findGameLevels() async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}game/levels/1",
      );
      print(response.data);
      return LevelResponse.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
