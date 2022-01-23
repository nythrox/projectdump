

import 'package:flutter/material.dart';

class ThemeButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final Function() onPressed;
  const ThemeButton(
      {Key key,
      @required this.title,
      this.color = Colors.blue,
      @required this.onPressed,
      this.textColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
        child: Text(title, style: TextStyle(color: textColor, fontSize: 20)),
      ),
      onPressed: onPressed,
    );
  }
}
