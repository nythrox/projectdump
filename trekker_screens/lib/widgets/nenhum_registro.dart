import 'package:flutter/material.dart';

class EmptyItems extends StatelessWidget {

  final IconData icon;
  final String text;

  const EmptyItems({Key key, this.icon, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            this.icon ?? Icons.assignment_late,
            size: 120,
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            this.text ?? "Nenhum registro até o momento!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
