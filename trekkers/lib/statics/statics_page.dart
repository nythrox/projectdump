import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/statics/blocs/statics_page_bloc.dart';
import 'package:trekkers/statics/models/relatorio-trilha.dart';
import 'package:trekkers/statics/repositories/trails_repository.dart';
import 'package:trekkers/statics/widgets/static_columns.dart';
import 'package:flutter/material.dart';

class StaticsPage extends StatefulWidget {
  final int id;
  final String name;

  const StaticsPage({Key key, this.id, this.name}) : super(key: key);

  @override
  _StaticsPageState createState() => _StaticsPageState();
}

class _StaticsPageState extends State<StaticsPage> {
  StaticsPageBloc _staticsPageBloc;

  @override
  void initState() {
    super.initState();
    _staticsPageBloc =
        StaticsPageBloc(widget.id, TrailsRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ESTATISTÍCAS",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
          centerTitle: true,
        ),
        body: FutureBuilder<RelatorioTrilha>(
            future: _staticsPageBloc.statistics,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text("Ocorreu um erro. Por favor, tente novamente.");
              if (snapshot.hasData)
                return Container(
                  // TODO: fix page aligment
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.name,
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
                        StaticsColumns("VELOCIDADE MÉDIA", "5,3",
                            thirdText: "KM/H"),
                        StaticsColumns("VELOCIDADE ATUAL", "0,0",
                            thirdText: "KM/H"),
                        StaticsColumns("RITMO MÉDIO", "15:0",
                            thirdText: "KM/H"),
                      ]),
                      Row(children: <Widget>[
                        StaticsColumns("TEMPO DECORRIDO", "00:00:00"),
                        StaticsColumns("TEMPO DE GRAVAÇÃO", "00:00:00"),
                        StaticsColumns("TEMPO TOTAL", "00:00:00"),
                      ]),
                      Row(children: <Widget>[
                        StaticsColumns("ELEVAÇÃO ATUAL", "5,3",
                            thirdText: "METROS"),
                        StaticsColumns("GANHO DE ELEVAÇÃO", "0,0",
                            thirdText: "METROS"),
                        StaticsColumns("PERDA DE ELEVAÇÃO", "15:0",
                            thirdText: "METROS"),
                      ]),
                    ],
                  ),
                );
              return CircularProgressIndicator();
            }));
  }
}
