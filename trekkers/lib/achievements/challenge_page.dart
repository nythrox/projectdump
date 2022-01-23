import 'package:flutter/material.dart';
import 'package:trekkers/achievements/blocs/challenge_page_bloc.dart';
import 'package:trekkers/achievements/repositories/tile_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key key, this.userId, this.tileId}) : super(key: key);
  final int userId;
  final int tileId;

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  ChallengePageBloc _challengePageBloc;

  @override
  void initState() {
    super.initState();
    _challengePageBloc = ChallengePageBloc(
        widget.userId, widget.tileId, TileRepository(CustomDio()));
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
        padding: EdgeInsets.all(50.0),
        child: FutureBuilder<dynamic>(
            future: _challengePageBloc.tileDetails,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text("Ocorreu um erro. Por favor tente novamente.");
              if (snapshot.hasData)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Desafio 50k",
                        style: TextStyle(color: Colors.black54, fontSize: 19.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Center(
                        child: Image.network(
                          "https://res.cloudinary.com/teepublic/image/private/s--PBwzZmr_--/t_Preview/b_rgb:ffffff,c_limit,f_jpg,h_630,q_90,w_630/v1548068917/production/designs/4048887_0.jpg",
                          width: 200,
                          height: 300.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "50",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 33.0,
                              color: Colors.black54,
                              decoration: TextDecoration.none),
                        ),
                        TextSpan(
                          text: "km",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                              color: Colors.black54,
                              decoration: TextDecoration.none),
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25.0),
                      child: Text(
                        "20/07/2019",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 24.0),
                      ),
                    ),
                  ],
                );
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
