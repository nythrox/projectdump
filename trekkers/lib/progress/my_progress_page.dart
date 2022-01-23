import 'package:trekkers/progress/blocs/my_progress_bloc.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/model/progress.dart';
import 'package:trekkers/store/repositories/game_repository.dart';
import 'package:flutter/material.dart';

class MyProgressPage extends StatefulWidget {
  const MyProgressPage({Key key}) : super(key: key);

  @override
  _MyProgressPageState createState() => _MyProgressPageState();
}

class _MyProgressPageState extends State<MyProgressPage> {
  IMyProgressBloc _myProgressBloc;

  @override
  void initState() {
    _myProgressBloc = MyProgressBloc(GameRepository(CustomDio()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Progress>(
        future: _myProgressBloc.progress,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: Column(children: [
                  Text(
                    "Rully Alves",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 23.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 27.0),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: NetworkImage(
                          "https://i.udemycdn.com/user/200_H/37919102_016d_2.jpg"),
                    ),
                  ),
                  Text(
                    "Nível Corvo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.black45),
                  ),
                  Container(
                    height: 10.0,
                    width: MediaQuery.of(context).size.width / 1.5,
                    margin: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black26,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.amberAccent[700]),
                      value: 0.8,
                    ),
                  ),
                  Text(
                    "4.200/7.000 xp",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 21.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10.0),
                    child: CircleAvatar(
                      radius: 80.0,
                      foregroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          "https://png.pngtree.com/png-clipart/20190516/original/pngtree-circle-eagle-logo-concept-png-image_3555393.jpg"),
                    ),
                  ),
                  Container(
                    height: 0.7,
                    width: MediaQuery.of(context).size.width / 1.2,
                    color: Colors.black,
                    margin: EdgeInsets.only(bottom: 30.0),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 35.0, bottom: 10.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Pré requisitos",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.black45),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text("Curso de nós"),
                          value: true,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (v) {},
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          title: const Text("Curso preparação de mochilas"),
                          value: false,
                          activeColor: Theme.of(context).primaryColor,
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width / 1.2,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () => {},
                        child: Text(
                          "VER CONQUISTAS",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
