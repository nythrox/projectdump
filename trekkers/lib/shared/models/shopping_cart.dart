import 'package:mobx/mobx.dart';
import 'package:trekkers/shared/models/cart_item.dart';
import 'package:trekkers/store/model/product.dart';

part 'shopping_cart.g.dart';

class ShoppingCart = _ShoppingCart with _$ShoppingCart;

abstract class _ShoppingCart with Store {
  
  @observable
  ObservableList<CartItem> items = ObservableList<CartItem>();

  @computed
  double get total => items.fold(0, (acc, curr) => acc + curr.total);

  @computed
  int get amountOfItems => items?.length;

  @action
  void add(CartItem item) {
    if (!items.contains(item)) {
      items.add(item);
    }
  }

  @action
  void remove(CartItem item) {
    items.remove(item);
  }
}
