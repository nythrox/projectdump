import 'package:trekkers/level/friends_page.dart';
import 'package:trekkers/level/me_page.dart';
import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  final String event;
  LevelPage({Key key, this.event}) : super(key: key);

  @override
  _LevelPageState createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "NÍVEL",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Container(
              color: Colors.amberAccent[700],
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "EU",
                  ),
                  Tab(
                    text: "AMIGOS",
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[MePage(), FriendsPage()],
        ),
      ),
    );
  }
}
