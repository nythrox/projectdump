import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/model/product.dart';
import 'package:dio/dio.dart';

abstract class IProductRepository {
  Future<ProductResponse> findByCategoryId(int id);
}

class ProductRepository implements IProductRepository {
  final CustomDio _customDio;

  ProductRepository(this._customDio);

  @override
  Future<ProductResponse> findByCategoryId(int categoryId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}products/category/$categoryId",
      );
      return ProductResponse.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> findProductById(int id) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}products/$id",
      );
      return Product.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
