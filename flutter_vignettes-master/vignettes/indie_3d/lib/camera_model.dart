import 'dart:math';

import 'package:vector_math/vector_math.dart' as vec32;
import 'package:flutter/material.dart';
import 'package:indie_3d/demo.dart';
import 'package:indie_3d/indie_3d_model.dart';
import 'package:indie_3d/main.dart';
import 'package:indie_3d/scaling_gesture_detecture.dart';

import 'package:shared/ui/widget_model.dart';

import './indie_3d_model_controller.dart';

class CameraModel extends StatefulWidget {
  @override
  _CameraModelState createState() => _CameraModelState();
}

class _CameraModelState extends State<CameraModel> {
  CameraVertexController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraVertexController([
      ObjPath('star', "${App.bundle}/assets", 'star.obj'),
    ], [
      InstanceInfo('star', position: vec32.Vector3(2, 0, 1)),
      InstanceInfo('star', position: vec32.Vector3(0, 1, 2)),
      InstanceInfo('star', position: vec32.Vector3(1, 0, 4)),
    ]);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    if (!controller.isReady) {
      controller.init(context);
      return CircularProgressIndicator();
    }
    
    return Scaffold(
      body: ScalingGestureDetector(
        // behavior: HitTestBehavior.translucent,
        onPanUpdate: handlePan,
        // onScaleUpdate: handleScale,
        // onVerticalDragUpdate: handleVerticalDrag,
        // onHorizontalDragUpdate: handleHorizontalDrag,
        child: Container(
          color: Colors.red,
          constraints: BoxConstraints.expand(),
          child: ScreenInstance(controller.meshInstances),
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            child: Text("-"),
            onPressed: () {
              controller.removeLastInstance();
            },
          ),
          FloatingActionButton(
            child: Text("+"),
            onPressed: () {
              final r = Random.secure();
              controller.addInstance(
                  InstanceInfo('star', position: vec32.Vector3(r.nextDouble() * 5, r.nextDouble() * 5, r.nextDouble() * 5)));
            },
          )
        ],
      ),
    );
  }

  // void handleScale(Offset delta, double scale) {
  //   if (scale < 1) {
  //     controller.moveFoward(scale * 2);
  //   }
  //   if (scale > 0) controller.moveFoward(scale * -0.5);
  // }

  void handlePan(Offset initialPoint, Offset delta) {
    if (delta != null && delta != Offset.zero) controller.updateXY(delta * 0.1);
  }

  // void handleVerticalDrag(double offset) {
  //   controller.updateY(offset * 0.5);
  // }

  // void handleHorizontalDrag(double offset) {
  //   controller.updateX(offset * 0.5);
  // }
}

class ScreenInstance extends StatelessWidget {
  final List<VertexMeshInstance> vertexScreenInstances;

  const ScreenInstance(this.vertexScreenInstances, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SceneCustomPainter(vertexScreenInstances),
    );
  }
}

class SceneCustomPainter extends CustomPainter {
  List<VertexMeshInstance> _meshInstances;
  final _paint = Paint();
  final BlendMode blendMode;

  SceneCustomPainter(this._meshInstances, {this.blendMode = BlendMode.multiply});

  @override
  void paint(canvas, size) {
    canvas.scale(size.width * 0.5, size.height * 0.5);
    canvas.translate(1.0, 1.0);

    // Flip y
    // canvas.scale(1, 1);
    if (_meshInstances != null) {
      for (int i = 0; i < _meshInstances.length; i++) {
        if (_meshInstances[i].texture != null) {
          final paint = Paint();
          paint.shader = ImageShader(
              _meshInstances[i].texture,
              TileMode.clamp,
              TileMode.clamp,
              Matrix4.identity()
                  .scaled(1 / _meshInstances[i].texture.width,
                      1 / _meshInstances[i].texture.height, 1.0)
                  .storage);

          canvas.drawVertices(
              _meshInstances[i].vertices, BlendMode.multiply, paint);
        } else
          canvas.drawVertices(
              _meshInstances[i].vertices, blendMode, _paint);
      }
    }
  }

  @override
  bool shouldRepaint(SceneCustomPainter oldPainter) {
    // TODO: Do an actual state diff to check for repaint
    return true;
  }
}
