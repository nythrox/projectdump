import 'package:flutter/material.dart';

class TicketsListPage extends StatelessWidget {
  const TicketsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text("ESTATISTÍCAS",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.0)),
          centerTitle: true,
        ),
      body: ListView(children: <Widget>[
      ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return TicketContainer(
            "https://images.unsplash.com/photo-1500622944204-b135684e99fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
            "MONTANHA",
            "BRAZIL",
            "20",
            "NOV",
            opacity: true,
            icon: true,
          );
        },
      )
    ]),
    );
  }
}

class TicketContainer extends StatelessWidget {
  final String imageURl;
  final String trail;
  final String event;
  final String day;
  final String month;
  final bool opacity;
  final bool icon;
  const TicketContainer(
      this.imageURl, this.trail, this.event, this.day, this.month,
      {this.opacity, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: !opacity
                ? null
                : new ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.darken),
            image: NetworkImage(
              imageURl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Positioned(
            width: 150,
            bottom: 45.0,
            left: 30.0,
            child: Text(trail,
                style: TextStyle(
                    fontSize: 12.0,
                    decoration: TextDecoration.none,
                    color: Colors.yellow)),
          ),
          Positioned(
            width: 150,
            bottom: 20.0,
            left: 30.0,
            child: Text(
              event,
              style: TextStyle(
                  fontSize: 19.0,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
          ),
          Positioned(
            width: 50,
            top: 50.0,
            right: 10.0,
            child: Text(
              day,
              style: TextStyle(
                  fontSize: 35.0,
                  decoration: TextDecoration.none,
                  color: Colors.white),
            ),
          ),
          Positioned(
            width: 50,
            top: 30.0,
            right: 5.0,
            child: Text(
              month,
              style: TextStyle(
                  fontSize: 18.0,
                  decoration: TextDecoration.none,
                  color: Colors.yellow,
                  fontWeight: FontWeight.w100),
            ),
          ),
          Positioned(
              bottom: 12.0,
              right: 20.0,
              child: !icon
                  ? null
                  : Icon(
                        Icons.check_circle_outline,
                        size: 50.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
        ]));
  }
}
