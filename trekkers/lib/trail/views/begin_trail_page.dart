import 'package:trekkers/statics/widgets/static_columns.dart';
import 'package:flutter/material.dart';

class BeginTrailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("INICIAR TRILHA",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        body: Container(
          // TODO: fix page aligment
          color: Colors.white,
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Extensão",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "0,01",
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