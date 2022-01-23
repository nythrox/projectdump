import 'package:flutter/material.dart';
import 'package:indie_3d/demo.dart';

import 'package:shared/ui/widget_model.dart';

import './indie_3d_model_controller.dart';

class Indie3dModel extends StatefulWidget {
  final int pageIndex;

  Indie3dModel({this.pageIndex = 0});

  @override
  _Indie3dModelState createState() => _Indie3dModelState();
}

class _Indie3dModelState extends State<Indie3dModel> {
  RandomVertexController controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    List<VertexMesh> meshes = await preloadedMeshes[widget.pageIndex];
    setState(() {
      controller = RandomVertexController.fromVertexMeshes(
          meshes, preloadInstanceInfos[widget.pageIndex]);

      controller.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    if (controller != null) {
      if (!(controller.controllerState == ControllerState.running)) {
        controller.init(context);
      }
      // controller.setView(MediaQuery.of(context).size);
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      controller.removeLastInstance();
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(
                        controller.controllerState == ControllerState.paused
                            ? Icons.play_arrow
                            : Icons.pause),
                    onPressed: () {
                      if (controller.controllerState == ControllerState.paused)
                        controller.play();
                      else
                        controller.pause();
                    },
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      controller.addInstance(preloadInstanceInfos[widget.pageIndex].first);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTapUp: _handleTap,
                behavior: HitTestBehavior.translucent,
                child: Stack(
                  fit: StackFit.expand,
                  children: controller.isReady
                      ? controller.meshInstances
                          .map((meshInstance) => MeshInstance(meshInstance))
                          .toList()
                      : [],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  void _handleTap(TapUpDetails details) {
    controller.triggerTap(context, details.localPosition);
  }
}

class MeshInstance extends StatelessWidget {
  final VertexMeshInstance vertexMeshInstance;

  const MeshInstance(this.vertexMeshInstance, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MeshCustomPainter(vertexMeshInstance),
    );
  }
}
