import 'package:flutter/material.dart';
//import 'CustomRoundedRectangleBorder.dart';

class LevelName extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;
  final Widget link;

  LevelName(
    this.title,
    this.subtitle,
    this.color,
    this.link,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width / 2 - 8, //-8 is the padding
      padding: EdgeInsets.only(top: 16, left: 16),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height / 4,
      ),
      child: RaisedButton(
        //clipBehavior: Clip.antiAlias,
        animationDuration: Duration(milliseconds: 200),
        // shape: CustomRoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //     bottomSide: BorderSide(color: color, width: 15),
        //     bottomLeftCornerSide:
        //         BorderSide(color: color, width: 8),
        //     bottomRightCornerSide: BorderSide(color: color, width: 8),
        //     rightSide: BorderSide(color: color, width: 4),
        //     leftSide: BorderSide(color: color, width: 4)
        //     ),
        padding: EdgeInsets.only(top: 30, bottom: 0, left: 20, right: 20),
        color: color,
        elevation: 0,
        //height: MediaQuery.of(context).size.height / 3 - 25,
        splashColor: color,
        onPressed: () {
          Route route = MaterialPageRoute(builder: (contex) => link);
          Navigator.push(context, route);
        },
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text(subtitle,
                  //     textAlign: TextAlign.start,
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.bold)),
                  Text(title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container(
              alignment: Alignment(0.9, 0.9),
              child: Text(subtitle,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 44,
                      fontWeight: FontWeight.w900)),
            ),
          ],
        ),
      ),
    );
  }
}
