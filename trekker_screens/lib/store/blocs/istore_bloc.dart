

import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/store/model/product.dart';

abstract class IStoreBloc{
  Future<List<Category>> get categories;
  Future<List<Product>> findProductsByCategoryId(int id);
}