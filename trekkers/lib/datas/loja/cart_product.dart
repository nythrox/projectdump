import 'package:trekkers/datas/loja/product_data.dart';

class CartProduct {
  int cid;

  String category;
  int pid;

  int quantity;
  String size;

  ProductData productData;

  CartProduct(
      {this.cid,
      this.category,
      this.pid,
      this.quantity,
      this.size,
      this.productData});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _cartProductFromJson(json);

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
      "size": size,
      //"product": productData.toResumeMap()
    };
  }
}

CartProduct _cartProductFromJson(Map<String, dynamic> json) {
  return CartProduct(
    cid: json['id'] as int,
    category: json['category'] as String,
    pid: json['pid'] as int,
    quantity: json['quantity'] as int,
    size: json['size'] as String,
  );
}
