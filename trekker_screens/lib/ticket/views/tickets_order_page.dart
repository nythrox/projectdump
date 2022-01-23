import 'package:trekkers/ticket/views/ticket_lot.dart';
import 'package:flutter/material.dart';

class TicketsOrderPage extends StatelessWidget {
  const TicketsOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 30.0, bottom: 15.0, top: 30.0),
            child: Text("INGRESSOS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    decoration: TextDecoration.none,
                    color: Colors.black)),
          ),
          Divider(
            height: 0.6,
            indent: 30.0,
            endIndent: 30.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 15.0, right: 30.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.none,
                    color: Colors.black54)),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, i) => const Divider(
                height: 1,
                indent: 30.0,
                endIndent: 30.0,
                color: Colors.black,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return TicketLot();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 30.0, right: 35.0, top: 50.0, bottom: 20.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Quantidade",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
              Spacer(),
              Text("2 Lotes",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(
                left: 30.0, right: 35.0, top: 7.0, bottom: 40.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Total",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
              Spacer(),
              Text("\$50,00",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
            ]),
          ),
          Center(
            child: Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width / 1.1,
              margin: EdgeInsets.only(bottom: 20.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () => {},
                child: Text(
                  "FAZER PEDIDO",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
