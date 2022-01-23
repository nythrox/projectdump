import 'package:trekkers/checkin/views/pendente_page.dart';
import 'package:trekkers/checkin/views/realizado_page.dart';
import 'package:flutter/material.dart';

class CheckInPage extends StatefulWidget {
  final String event;
  const CheckInPage({Key key, this.event}) : super(key: key);

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "CHECK-IN",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Container(
              color: Colors.amberAccent[700],
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  Tab(
                    text: "REALIZADO",
                  ),
                  Tab(
                    text: "PENDENTE",
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[RealizadoPage(), PendentePage()],
        ),
      ),
    );
  }
}
