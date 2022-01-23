import 'package:flutter/material.dart';
import 'package:trekkers/friends/models/friend.dart';
import 'package:trekkers/level/blocs/friends_page_bloc.dart';
import 'package:trekkers/shared/repositories/progress_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/store/model/progress.dart';
import 'package:trekkers/store/repositories/game_repository.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key key, this.friend}) : super(key: key);
  final Friend friend;
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  FriendsPageBloc _friendsPageBloc;

  @override
  void initState() {
    super.initState();
    _friendsPageBloc =
        FriendsPageBloc(widget.friend.id, GameRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Progress>(
          future: _friendsPageBloc.progress,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text("Ocorreu um erro. Por favor, tente novamente.");
            if (snapshot.hasData)
              return Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Column(children: [
                    Text(
                      widget.friend.name,
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
                        backgroundImage: NetworkImage(widget.friend.avatar),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.black26,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.amberAccent[700]),
                        value: 0.8,
                      ),
                    ),
                    Text(
                      snapshot.data.xp.toString() +
                          "/" +
                          snapshot.data.maxPoints.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 21.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10.0),
                      child: CircleAvatar(
                        radius: 80.0,
                        foregroundColor: Colors.black,
                        backgroundImage: NetworkImage(snapshot.data.image),
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
                          ...checkboxListTileBuilder(
                              snapshot.data.prerequisitDone),
                          ...checkboxListTileBuilder(snapshot.data.prerequisit),
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
              );
            return CircularProgressIndicator();
          }),
    );
  }

  List<Widget> checkboxListTileBuilder(List<Course> courses) {
    List<Widget> widgets = [];
    courses.forEach((course) => widgets.add(CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(course.name),
          value: course.completed,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (v) {},
        )));
    return widgets;
  }
}
