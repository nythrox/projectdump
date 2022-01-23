import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trekkers/cart/components/amount_button.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/main.dart';
import 'package:trekkers/shared/models/cart_item.dart';
import 'package:trekkers/shared/utils/constants.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingCart = AuthenticationProvider.of(context).shoppingCart;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20.0, top: 15),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  "$URL_IMG${item.product.images.first.link}",
                  width: 75,
                  height: 80,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                  fit: BoxFit.contain,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${item.product.name.toUpperCase()}",
                      softWrap: true,
                      maxLines: 4,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(bottom: 11),
                  onPressed: () => shoppingCart.remove(item),
                  icon: Icon(
                    Icons.restore_from_trash,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                "Quantidade",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
              ),
              Row(
                children: <Widget>[
                  AmountButton(
                    borderColor: Colors.grey,
                    icon: const Icon(
                      Icons.remove,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: item.decrement,
                  ),
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text("${item.amount}"),
                      );
                    },
                  ),
                  AmountButton(
                    borderColor: Colors.grey,
                    icon: const Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: item.increment,
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15),
          child: Row(
            children: <Widget>[
              const Text(
                "Valor",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
              ),
              const Spacer(),
              Observer(builder: (_) {
                return Text(
                  "${item.total}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18.0),
                );
              }),
            ],
          ),
        ),
        const Divider(
          height: 1,
          indent: 20.0,
          endIndent: 20.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
