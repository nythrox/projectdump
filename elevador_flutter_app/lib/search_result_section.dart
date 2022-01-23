
import 'package:flutter/material.dart';

class SearchResultSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SearchResultSection({Key key, @required this.title, this.children})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        ...children
      ],
    );
  }
}