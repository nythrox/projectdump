import 'package:flutter/material.dart';

class FriendTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final int percentage;
  final Color color;
  const FriendTile(this.imageUrl, this.title, this.subtitle, this.percentage, this.color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Text(
            subtitle,
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 13.0, color: Colors.black54),
          ),
          SizedBox( width: 80.0),
            Text(
        "$percentage%",
        style: TextStyle(
fontSize: 14.0, color: percentage <= 50 ? Colors.red : Colors.green)
      ),
        ],
      ),
      trailing: Container(
        height: 23.0,
        child: RaisedButton(
          onPressed: (){},
          color: Colors.greenAccent[400],
          child: Text("Amigo", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),),
          shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
        ),
      ),
    );
  }
}
