import 'package:mobx/mobx.dart';
import 'package:trekkers/store/model/product.dart';
part 'cart_item.g.dart';

class CartItem = _CartItem with _$CartItem;

abstract class _CartItem with Store {
  final Product product;

  @observable
  int amount = 1;

  _CartItem(this.product);

  @computed
  double get total => product.price * amount;

  @action
  void increment() => amount++;

  @action
  void decrement() {
    if (amount > 1) amount--;
  }

  @override
  bool operator ==(other) => other is CartItem && other.product == this.product;

  @override
  int get hashCode => product.hashCode;
}
