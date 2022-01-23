import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

abstract class IProductCategoryRepository {
  Future<CategoryResponse> findAll();
}

class ProductCategoryRepository implements IProductCategoryRepository {
  final CustomDio _customDio;

  ProductCategoryRepository(this._customDio);

  @override
  Future<CategoryResponse> findAll() async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}categories/type/produtos",
      );
      return CategoryResponse.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
