import 'package:trekkers/news/models/news.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

abstract class INewsRepository {
  Future<NewsResponse> findAll();
}

class NewsRepository implements INewsRepository {
  final CustomDio _customDio;

  NewsRepository(this._customDio);

  @override
  Future<NewsResponse> findAll() async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        '${dio.options.baseUrl}news',
      );
      return NewsResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
