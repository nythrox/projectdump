import 'package:flutter/material.dart';

class StaticsColumns extends StatelessWidget {
  final String firstText;
  final String middleText;
  final String thirdText;
  const StaticsColumns(this.firstText,this.middleText, {this.thirdText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0,bottom: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            firstText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: Colors.black54,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            middleText,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24.0,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            thirdText ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
