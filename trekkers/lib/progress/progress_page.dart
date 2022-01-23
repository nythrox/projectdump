import 'package:flutter/cupertino.dart';
import 'package:trekkers/achievements/achievements_page.dart';
import 'package:trekkers/achievements/achievements_progress.dart';
import 'package:trekkers/progress/blocs/iprogress_bloc.dart';
import 'package:trekkers/progress/blocs/progress_bloc.dart';
import 'package:trekkers/progress/progress_widget.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/model/level.dart';
import 'package:trekkers/store/repositories/game_repository.dart';
import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  IProgressBloc _progressBloc;

  @override
  void initState() {
    _progressBloc = ProgressBloc(GameRepository(CustomDio()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PROGRESSO",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<List<Level>>(
              future: _progressBloc.levels,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Ocorreu um erro"),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(30.0),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    final item = snapshot.data[index];

                    return ProgressWidget(
                      backgroundImage: NetworkImage(
                          "https://mpng.pngfly.com/20180920/qcf/kisspng-logo-world-wide-fund-for-nature-giant-panda-decal-cute-panda-decal-5ba42bc6135ee3.9740720315374857660794.jpg"),
                      requisitos: item.preRequisits.map((e) => e.title),
                      xp: "${item.completed}/${item.maxPoints}",
                      progressIndicatorValue: item.completed == 0
                          ? 0
                          : ((item.maxPoints / item.completed) / 8),
                      animal: item.name,
                    );
                  },
                );
              }),
          Center(
            child: Container(
              height: 45.0,
              margin: const EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (_) => AchievementsProgress()));
                },
                child: Text(
                  "VER CONQUISTAS",
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
