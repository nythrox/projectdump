import 'package:flutter/material.dart';

class LessonName extends StatelessWidget {
  final String title;
  final Widget link;
  final IconData icon;
  LessonName(this.title, this.link,this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (contex) => link);
        Navigator.push(context, route);
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
          left: 24.0,
          right: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30, left: 118, right: 0),
              margin: new EdgeInsets.only(left: 0.0),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                  ]),
                  Row(
                    children: <Widget>[
                      Text("Milkway Galaxy",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.8))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("5 minutes ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8))),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text("10 / 10",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8))),
                      ),
                    ],
                  )
                ],
              ),
              decoration: new BoxDecoration(gradient: LinearGradient(
                        colors: [
                          const Color(0xFFFFFFFF),
                          const Color(0xFFFFFFFF)
//                          const Color(0xFF33CCFF)
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                
                border: Border.all(color: Colors.grey,width: 1)
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,

              child: Container(
                margin: EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                color: new Color(0xFF333366),
                    
                    borderRadius: BorderRadius.all(Radius.circular(1000))),
                padding: EdgeInsets.all(10),
                height: 90,
                width: 90,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              // new Image(
              //   image: new AssetImage("assets/img/mars.png"),
              //   height: 92.0,
              //   width: 92.0,
              // ),
            )
          ],
        ),
      ),
    );

  }
  /*
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (contex) => link);
                  Navigator.push(context, route);
                }*/
}
