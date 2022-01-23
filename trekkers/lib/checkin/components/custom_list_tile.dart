import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final Color color;
  const CustomListTile(this.imageUrl, this.title, this.subtitle, this.color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontWeight: FontWeight.w300, fontSize: 15.0, color: Colors.black),
      ),
      trailing: CircleAvatar(backgroundColor: color, radius: 10.0),
    );
  }
}
