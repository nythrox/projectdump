import 'package:flutter/material.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40.0,
            width: 40.0,
                        child: CircularProgressIndicator(
                value: 0.5,
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.amberAccent[700]),
                backgroundColor: Colors.black26,
              ),
          ),
          Row(
            children: <Widget>[
              Flexible(
            flex: 3,
                      child: CircularProgressIndicator(
              value: 0.5,
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.amberAccent[700]),
              backgroundColor: Colors.black26,
            ),
          ),
          Flexible(
            flex: 3,
                      child: CircularProgressIndicator(
              value: 0.5,
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.amberAccent[700]),
              backgroundColor: Colors.black26,
            ),
          ),

          Flexible(
            flex: 3,
                      child: CircularProgressIndicator(
              value: 0.5,
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.amberAccent[700]),
             backgroundColor: Colors.black26,
            ),
          )
            ],
          )
        ],
      ),
    );
  }
}