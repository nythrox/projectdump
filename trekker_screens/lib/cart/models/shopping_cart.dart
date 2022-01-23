import 'package:trekkers/cart/models/cart_item.dart';
import 'package:trekkers/store/model/product.dart';

class ShoppingCart {
  final _items = <CartItem>[];

  List<CartItem> get items => _items;

  double get total => _items.fold(0, (acc, curr) => acc + curr.total);

  int get numOfItems => items?.length;

  void add(Product product) {
    final item = CartItem(product);
    if (!_items.contains(item)) {
      _items.add(item);
    }
  }

  void remove(CartItem item) {
    items.remove(item);
  }
}
