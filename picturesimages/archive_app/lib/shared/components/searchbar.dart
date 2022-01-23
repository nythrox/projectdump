import 'package:archive_app/shared/utils/functional_flutter_hooks.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar(this.placeholder);
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xff202020), borderRadius: BorderRadius.circular(999)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20),
          Icon(
            Icons.menu,
            size: 30,
          ),
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  hintText: placeholder, border: InputBorder.none),
            ),
          ),
          SizedBox(width: 20),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
