import 'package:trekkers/store/model/product.dart';

class CartItem {
  String _id;
  final Product product;
  int _amount = 1;

  CartItem(this.product);

  int get amount => this._amount;
  double get total => product.price * _amount;

  void increment() => _amount++;

  void decrement() {
    if (_amount > 1) _amount--;
  }

  @override
  bool operator ==(other) => other is CartItem && other.product == this.product;

  @override
  int get hashCode => product.hashCode * super.hashCode;
}
