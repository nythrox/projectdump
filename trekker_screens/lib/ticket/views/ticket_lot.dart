import 'package:trekkers/cart/components/amount_button.dart';
import 'package:flutter/material.dart';

class TicketLot extends StatelessWidget {
  const TicketLot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool colorState = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, bottom: 10.0, top: 10.0),
              child: Text("Lote 1 - O PODER DO AGORA",
                  style: TextStyle(
                      fontSize: 13.0,
                      decoration: TextDecoration.none,
                      color: Colors.black38)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 13.0),
              child: Text("texto aqui",
                  style: TextStyle(
                      fontSize: 11.0,
                      decoration: TextDecoration.none,
                      color: Colors.black38)),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
              child: Text("outro texto",
                  style: TextStyle(
                      fontSize: 12.0,
                      decoration: TextDecoration.none,
                      color: Colors.black38)),
            ),
          ],
        ),
         /*
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
                    ),
         */
        Flexible(
          child: Container(
            height: 30.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(13.0),
                  side: BorderSide(
                      color: !colorState ? Colors.red : Colors.amber)),
              onPressed: () {},
              color: Colors.white,
              textColor: !colorState ? Colors.red : Colors.amber,
              child: Text(
                !colorState ? "VENDAS ENCERRADAS" : "PRÓXIMO LOTE",
                textScaleFactor: 1.2,
                maxLines: 2,
                softWrap: true,
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddTicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 10.0, top: 10.0),
                  child: Text("Lote 1 - O PODER DO AGORA",
                      style: TextStyle(
                          fontSize: 13.0,
                          decoration: TextDecoration.none,
                          color: Colors.black38)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 30.0, bottom: 13.0),
                  child: Text("texto aqui",
                      style: TextStyle(
                          fontSize: 11.0,
                          decoration: TextDecoration.none,
                          color: Colors.black38)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 30.0, bottom: 15.0),
                  child: Text("outro texto",
                      style: TextStyle(
                          fontSize: 12.0,
                          decoration: TextDecoration.none,
                          color: Colors.black38)),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                  color: Colors.black38,
                ),
                Text(
                  "2",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  color: Colors.black38,
                ),
              ],
            )
          ],
        ),
        Divider(
          height: 1,
          indent: 30.0,
          endIndent: 30.0,
          color: Colors.black,
        ),
      ],
    );
  }
}
