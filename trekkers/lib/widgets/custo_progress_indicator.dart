import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
        strokeWidth: 5,
      ),
    );
  }
}
