import 'package:flutter/material.dart';
import 'package:indie_3d/camera.dart';
import 'package:indie_3d/camera_model.dart';
import 'package:shared/env.dart';

import './demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static String _pkg = 'indie_3d';
  static String get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(context) {
    return MaterialApp(
      // home: Indie3dHome(),
      home: CameraModel(),
    );
  }
}