import 'package:trekkers/ticket/views/tickets_order_page.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://conteudo.imguol.com.br/c/noticias/a7/2015/12/24/24dez2015---lua-cheia-ilumina-o-ceu-na-cidade-de-fuencaliente-de-medinaceli-em-soria-na-espanha-na-vespera-de-natal-o-fenomeno-nao-acontecia-nesta-data-desde-1977-1450988150945_615x300.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: <Widget>[
            Positioned(
              width: 150,
              bottom: 45.0,
              left: 30.0,
              child: Text("TRILHA NOTURNA",
                  style: TextStyle(
                      fontSize: 12.0,
                      decoration: TextDecoration.none,
                      color: Colors.yellow)),
            ),
            Positioned(
              width: 150,
              bottom: 20.0,
              left: 30.0,
              child: Text(
                "LUA CHEIA",
                style: TextStyle(
                    fontSize: 19.0,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            Positioned(
              width: 50,
              bottom: 75.0,
              right: 10.0,
              child: Text(
                "19",
                style: TextStyle(
                    fontSize: 35.0,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
            Positioned(
               width: 50,
              bottom: 55.0,
              right: 5.0,
              child: Text(
                "ABR",
                style: TextStyle(
                    fontSize: 18.0,
                    decoration: TextDecoration.none,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w100),
              ),
            ),
          ])),
          Expanded(child: TicketsOrderPage(),
          )
    ]);
  }
}
