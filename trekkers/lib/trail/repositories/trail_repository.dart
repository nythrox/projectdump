import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/trail/models/start_trail_dto.dart';
import 'package:trekkers/trail/models/trail_log_dto.dart';

class TrailRepository {
  final CustomDio _customDio;

  TrailRepository(this._customDio);

  Future<dynamic> saveTrailLog(TrailLogDto log) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post("${dio.options.baseUrl}events/trail-logs",
          data: jsonEncode(log));
      return response.data;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getTrailLog(int id) async {
    final dio = _customDio.dio;
    try {
      final response =
          await dio.get("${dio.options.baseUrl}events/trails/" + id.toString());
      return response.data;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> startTrail(StartTrailDto startTrailDto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post("${dio.options.baseUrl}events/trails/",
          data: jsonEncode(startTrailDto));
      return response.data;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
