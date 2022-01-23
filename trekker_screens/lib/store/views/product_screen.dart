import 'package:carousel_pro/carousel_pro.dart';
import 'package:trekkers/cart/components/amount_button.dart';
import 'package:trekkers/store/model/product.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/utils/network/utils.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var size;
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Carousel(
                  images: widget.product.images.map((i) {
                    return NetworkImage(NetworkUtils.urlBase + i.link);
                  }).toList(),
                  dotSize: 6,
                  dotIncreaseSize: 0,
                  showIndicator: true,
                  dotSpacing: 15,
                  dotBgColor: Colors.transparent,
                  dotColor: Colors.grey,
                  autoplay: false,
                ),
                Positioned(
                  bottom: -3,
                  right: -3,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: const Icon(Icons.fullscreen_exit),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 27, left: 10, right: 10),
                  child: Text(
                    widget.product.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, bottom: 15),
                  child: Text(
                    widget.product.brand.toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                    maxLines: 3,
                  ),
                ),
                Text(
                  "R\$ ${widget.product.price}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22, top: 10),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 0.4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Tamanho",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.product.variations
                          .map<Widget>(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: AmountButton(
                                onTap: () {},
                                borderColor: Colors.grey,
                                icon: Text(
                                  e.value,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                radius: 70,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Quantidade",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        AmountButton(
                          onTap: () {},
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.remove,
                              size: 15, color: Colors.grey),
                          radius: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text("5"),
                        ),
                        AmountButton(
                          onTap: () {},
                          borderColor: Colors.grey,
                          icon: const Icon(Icons.add,
                              size: 15, color: Colors.grey),
                          radius: 40,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    padding: const EdgeInsets.all(12),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      //TODO: CASO O USUÁRIO ESTEJA DESLOGADO
                      // ELE DEVE ENTRAR PRA COMPRAR
                    },
                    child: const Text(
                      "COMPRAR",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
