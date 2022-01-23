import 'package:flutter/material.dart';

class PaymentValue extends StatelessWidget {
  const PaymentValue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(left: 45.0, right: 35.0, top: 50.0, bottom: 20.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Subtotal",
                style: TextStyle(
                    fontSize: 15.0,
                    decoration: TextDecoration.none,
                    color: Colors.black45)),
            Spacer(),
            Text("\$100,00",
                style: TextStyle(
                    fontSize: 15.0,
                    decoration: TextDecoration.none,
                    color: Colors.black45)),
          ]),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 45.0, right: 35.0, top: 7.0, bottom: 20.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Frete",
                style: TextStyle(
                    fontSize: 13.0,
                    decoration: TextDecoration.none,
                    color: Colors.black38)),
            Spacer(),
            Text("\$50,00",
                style: TextStyle(
                    fontSize: 15.0,
                    decoration: TextDecoration.none,
                    color: Colors.black38)),
          ]),
        ),
        Container(
          margin:
              EdgeInsets.only(left: 45.0, right: 35.0, top: 7.0, bottom: 40.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Total",
                style: TextStyle(

                    fontSize: 18.0,
                    decoration: TextDecoration.none,
                    color: Colors.black)),
            Spacer(),
            Text("\$100,00",
                style: TextStyle(
                    fontSize: 18.0,
                    decoration: TextDecoration.none,
                    color: Colors.black)),
          ]),
        ),
      ],
    );
  }
}
