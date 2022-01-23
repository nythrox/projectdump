import 'package:archive_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        canvasColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}
