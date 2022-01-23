import 'package:trekkers/store/model/product.dart';
import 'package:trekkers/store/repositories/product_repository.dart';

class ProductDetailPageBloc {
  final ProductRepository _productRepository;

  Future<Product> product;

  ProductDetailPageBloc(int id, this._productRepository){
    product = _productRepository.findProductById(id);
  }
}