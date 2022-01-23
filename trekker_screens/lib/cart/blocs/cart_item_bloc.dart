import 'package:trekkers/cart/models/cart_item.dart';
import 'package:trekkers/store/model/product.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  final _items$ = new BehaviorSubject<List<CartItem>>();
  ValueObservable<List<CartItem>> get itens => _items$.stream;
  void updateItems(List<CartItem> itens) => _items$.add(itens);

  ValueObservable<bool> inCart;

  ProductBloc(Product product) {
    inCart = _items$
        .map((dados) => dados.any((e) => e.product == product))
        .publishValue()
          ..connect();
  }

  void dispose() {
    _items$?.close();
  }
}
