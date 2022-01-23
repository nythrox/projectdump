import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> content;

  LevelWidget(this.title, this.description, this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 66),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return content[index];
                },
                itemCount: content.length,
              ),
            ),
            GradientAppBar(title),
          ],
        ),
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double size = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarSize, right: 20, left: 20),
      height: statusBarSize + size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black.withOpacity(0.7))),
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color(0xFF00CCFF),
          gradient: LinearGradient(
              colors: [const Color(0xFFF8F8F8), const Color(0xFFF8F8F8)],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp)),
    );
  }
}
