import 'package:trekkers/cart/components/amount_button.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  "https://cache.mrporter.com/variants/images/5432698981476639/in/w2000_q80.jpg",
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
                      "CAMISA AUTHENTIC JERSEY",
                      softWrap: true,
                      maxLines: 4,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(bottom: 11),
                  onPressed: () {},
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
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text("5"),
                  ),
                  AmountButton(
                    borderColor: Colors.grey,
                    icon: const Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.grey,
                    ),
                    onTap: () {},
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
              Text(
                "\$200,00",
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 18.0),
              ),
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
