import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  final String title;
  final String mark;
  final String price;
  final String imageUrl;
  final void Function() onTap;

  const ProductTile(
      {Key key,
      @required this.title,
      @required this.mark,
      @required this.price,
      this.onTap,
      @required this.imageUrl})
      : super(key: key);
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
