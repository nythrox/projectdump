import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'circle_border_component.dart';

class AchievementsItems2 extends StatelessWidget {
  const AchievementsItems2({Key key}) : super(key: key);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                "Especialista em Rapel",
                style: TextStyle(color: Colors.black54, fontSize: 19.0),
              ),
            ),
            CustomCircularProgressIndicator(),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleBorderComponent(32.0, false, true,
                    "http://sonyphotog.com/photos/globalmedicalco/20/100048.jpg"),
                CircleBorderComponent(32.0, false, false,
                    "http://sonyphotog.com/photos/globalmedicalco/20/100048.jpg"),
                CircleBorderComponent(32.0, false, false,
                    "http://sonyphotog.com/photos/globalmedicalco/20/100048.jpg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(
          image: NetworkImage( "http://sonyphotog.com/photos/globalmedicalco/20/100048.jpg"))
      ),
      width: 160.0,
      height: 160.0,
      child: Stack(
        children: <Widget>[
          Positioned(
              width: 160.0,
              height: 160.0,
              child: CircularProgressIndicator(
                strokeWidth: 6.0,
                backgroundColor: Colors.black12,
                value: 0.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).accentColor),
              )),
          Positioned(
            top: 60.0,
            left: 55.0,
            right: 40.0,
              child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '40\n',
                    style: TextStyle(
                        fontSize: 45.0, color: Theme.of(context).accentColor)),
                TextSpan(
                    text: '/100',
                    style: TextStyle(
                        fontSize: 22.0, color: Theme.of(context).accentColor)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
