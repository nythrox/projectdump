
import 'package:trekkers/friends/me_friends_page.dart';
import 'package:flutter/material.dart';

class FriendListPage extends StatefulWidget {
  final String event;
  FriendListPage({Key key, this.event}) : super(key: key);

  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "AMIGOS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
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
          children: <Widget>[
           MeFriendsPage()
           , Container(color: Colors.white)],
        ),
      ),
    );
  }
}
