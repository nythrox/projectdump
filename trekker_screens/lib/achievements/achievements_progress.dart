import 'package:flutter/material.dart';
import 'package:trekkers/achievements/repositories/medal_repository.dart';
import 'package:trekkers/achievements/repositories/tile_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

import 'blocs/achievements_progress_bloc.dart';
import 'models/medal.dart';

class AchievementsProgress extends StatefulWidget {
  const AchievementsProgress({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _AchievementsProgressState createState() => _AchievementsProgressState();
}

class _AchievementsProgressState extends State<AchievementsProgress> {
  AchievementsProgressBloc _achievementsProgressBloc;

  @override
  void initState() {
    super.initState();
    _achievementsProgressBloc = AchievementsProgressBloc(
        widget.id, MedalRepository(CustomDio()), TileRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CONQUISTAS"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: Text(
                "Medalhas",
                style: TextStyle(color: Colors.black38, fontSize: 19.0),
              ),
            ),
            FutureBuilder<List<Medal>>(
                future: _achievementsProgressBloc.medals,
                builder: (context, snapshot) {
                  if (snapshot.hasError)
                    return Text("Ocorreu um erro. Por favor, tente novamente.");
                  if (snapshot.hasData && snapshot.data.isEmpty)
                    return Text("Não há nenhuma medalha.");
                  if (snapshot.hasData)
                    return GridView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return ProgressCircleAvatar(
                          medal: snapshot.data[index],
                        );
                      },
                    );
                  return CircularProgressIndicator();
                }),
            Divider(
              height: 1,
              endIndent: 20.0,
              indent: 20.0,
              color: Colors.black,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
              child: Text(
                "Aventuras concluídas",
                style: TextStyle(color: Colors.black38, fontSize: 19.0),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20.0, left: 20.0),
                  child: Image.network(
                    "https://res.cloudinary.com/teepublic/image/private/s--PBwzZmr_--/t_Preview/b_rgb:ffffff,c_limit,f_jpg,h_630,q_90,w_630/v1548068917/production/designs/4048887_0.jpg",
                    width: 150,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProgressCircleAvatar extends StatelessWidget {
  final Medal medal;
  const ProgressCircleAvatar({Key key, this.medal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          decoration: new BoxDecoration(
            border: Border.all(width: 7.0, color: Colors.black12),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 45.0,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(medal.image),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
          width: 80.0,
          child: LinearProgressIndicator(
            backgroundColor: Colors.black12,
            value: medal.status.toDouble(),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amberAccent[700]),
          ),
        )
      ]),
    );
  }
}
