import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trekkers/cart/components/cart_product.dart';
import 'package:trekkers/cart/components/payment_value.dart';
import 'package:trekkers/delivery/views/delivery_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/main.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
   final shoppingCart = AuthenticationProvider.of(context).shoppingCart;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CARRINHO",
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Observer(
             
              builder: (_) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: shoppingCart.amountOfItems,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      item: shoppingCart.items[index],
                    );
                  },
                );
              }
            ),
            PaymentValue(),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20, left: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: const EdgeInsets.all(12),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () => Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => const DeliveryPage()
                      )),
                      child: const Text(
                        "CONTINUAR",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
