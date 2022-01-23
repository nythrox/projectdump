import 'package:trekkers/achievements/blocs/achievements_items_bloc.dart';
import 'package:trekkers/achievements/circle_border_component.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/achievements/models/medal.dart';
import 'package:trekkers/achievements/models/medal_details.dart';
import 'package:trekkers/achievements/repositories/medal_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class AchievementsItems extends StatefulWidget {
  const AchievementsItems({Key key, this.userId, this.medalId})
      : super(key: key);
  final int userId;
  final int medalId;

  @override
  _AchievementsItemsState createState() => _AchievementsItemsState();
}

class _AchievementsItemsState extends State<AchievementsItems> {
  AchievementsItemsBloc _achievementsItemsBloc;

  @override
  void initState() {
    super.initState();
    _achievementsItemsBloc = AchievementsItemsBloc(
      
        widget.userId, widget.medalId, MedalRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONQUISTAS"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 50.0, left: 40.0, right: 40.0),
        child: FutureBuilder<MedalDetails>(
            future: _achievementsItemsBloc.details,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text("Ocorreu um erro. Por favor tente novamente.");
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        snapshot.data.name,
                        style: TextStyle(color: Colors.black54, fontSize: 19.0),
                      ),
                    ),
                    CircleBorderComponent(
                        70.0, false, true, snapshot.data.image),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: buildCircleBorderComponents(snapshot.data.children),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25.0),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "* Ex. Medalha de ouro bloqueada",
                        style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }

  List<Widget> buildCircleBorderComponents(List<MedalDetails> children) {
    List<Widget> widgets = [];
    children.forEach((child) => {
          widgets.add(
              CircleBorderComponent(30.0, child.status == 1, true, child.image))
        });
    return widgets;
  }
}
