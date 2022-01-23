import 'package:flutter/material.dart';
import 'package:trekkers/main.dart';

class ProductTile extends StatefulWidget {
  final String title;
  final String mark;
  final String price;
  final String imageUrl;
  final bool inCart;
  final void Function() onTap;
  final void Function() onIconTap;

  const ProductTile(
      {Key key,
      @required this.title,
      @required this.mark,
      @required this.price,
      this.onTap,
      @required this.imageUrl, this.inCart, this.onIconTap})
      : super(key: key);
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    final shoppingCart = AuthenticationProvider.of(context).shoppingCart;

    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 100,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Container(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Image.network(
                  widget.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 4, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title.toUpperCase(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.mark,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.price,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed:widget.onIconTap,
                  icon:widget.inCart ? const Icon(Icons.shopping_cart) : Icon(Icons.add_shopping_cart),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
