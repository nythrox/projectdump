import 'package:trekkers/statics/widgets/static_columns.dart';
import 'package:flutter/material.dart';

class StaticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ESTATISTÍCAS",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
          centerTitle: true,
        ),
        body: Container(
          // TODO: fix page aligment
          color: Colors.white,
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "TRILHA - O PODER DO AGORA",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 35.0,
              ),
              Text(
                "Extensão",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "10,00",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 60.0,
                        color: Colors.black54,
                        decoration: TextDecoration.none),
                  ),
                  TextSpan(
                    text: "km",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 30.0,
                        color: Colors.black54,
                        decoration: TextDecoration.none),
                  )
                ]),
              ),
              Row(children: <Widget>[
                StaticsColumns("VELOCIDADE MÉDIA", "5,3",thirdText: "KM/H"),
                StaticsColumns("VELOCIDADE ATUAL", "0,0",thirdText:  "KM/H"),
                StaticsColumns("RITMO MÉDIO", "15:0", thirdText:"KM/H"),
              ]),
              Row(children: <Widget>[
                StaticsColumns("TEMPO DECORRIDO", "00:00:00"),
                StaticsColumns("TEMPO DE GRAVAÇÃO", "00:00:00"),
                StaticsColumns("TEMPO TOTAL", "00:00:00"),
              ]),
              Row(children: <Widget>[
                StaticsColumns("ELEVAÇÃO ATUAL", "5,3",thirdText: "METROS"),
                StaticsColumns("GANHO DE ELEVAÇÃO", "0,0",thirdText:  "METROS"),
                StaticsColumns("PERDA DE ELEVAÇÃO", "15:0", thirdText:"METROS"),
              ]),
            ],
          ),
        ));
  }
}