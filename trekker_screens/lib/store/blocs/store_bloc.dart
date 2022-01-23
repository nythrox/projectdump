import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/store/blocs/istore_bloc.dart';
import 'package:trekkers/store/model/product.dart';
import 'package:trekkers/store/repositories/product_repository.dart';
import 'package:trekkers/store/repositories/store_category_repository.dart';

class StoreBloc implements IStoreBloc {
  final IProductCategoryRepository _categoryRepository;
  final IProductRepository _productRepository;

  @override
  Future<List<Category>> categories;

  StoreBloc(this._categoryRepository, this._productRepository) {
    categories = _categoryRepository.findAll().then((e) => e.categories);
  }

  Future<List<Product>> findProductsByCategoryId(int id) async {
    return _productRepository.findByCategoryId(id).then((e) => e.products);
  }
}
