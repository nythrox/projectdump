import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppBloc.theme$.add(ThemeData.dark());
  }
  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: AppBloc.theme$.stream,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: snapshot.data,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _animation = "roll";
  bool _isPaused = false;

  void toggleAnimation() {
    setState(() {
      if (_isPaused)
        _isPaused = false;
      else
        _isPaused = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.8),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Container(
                //   height: 300,
                //   child: FlareActor(
                //     "lib/assets/WorldSpin.flr",
                //     artboard: "Artboard",
                //     animation: _animation,
                //     fit: BoxFit.contain,
                //     isPaused: true,
                //     alignment: Alignment.center,
                //   ),
                // ),
                Text(_isPaused
                    ? "Press the button to play the animation"
                    : "Press the button to pause the animation"),
                Container(
                  height: 150,
                  child: FlareSwitch(
                    path: 'lib/assets/daynight.flr',
                    offAnimation: FlareAnimation(
                        duration: Duration(seconds: 2), name: "night_idle"),
                    onAnimation: FlareAnimation(
                        duration: Duration(seconds: 2), name: "day_idle"),
                    fromOnToOffAnimation: FlareAnimation(
                        duration: Duration(milliseconds: 500),
                        name: "switch_night"),
                    fromOffToOnAnimation: FlareAnimation(
                        duration: Duration(milliseconds: 500),
                        name: "switch_day"),
                    isPaused: _isPaused,
                    initialValue: false,
                    onChanged: (value)=>AppBloc.theme$.add(value ? ThemeData.light() : ThemeData.dark()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleAnimation,
        tooltip: _isPaused ? 'Play' : 'Pause',
        child: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FlareSwitch extends StatefulWidget {
  FlareSwitch({
    this.onChanged,
    @required this.path,
    @required this.offAnimation,
    @required this.onAnimation,
    this.value,
    this.initialValue,
    this.isPaused,
    this.fromOffToOnAnimation,
    this.fromOnToOffAnimation, this.controller,
  });

  final String path;
  final bool value; //value is important in case they want to externally manage the state
  final ValueChanged<bool> onChanged;
  final bool initialValue;
  final bool isPaused;
  final FlareAnimation offAnimation;
  final FlareAnimation fromOffToOnAnimation;
  final FlareAnimation fromOnToOffAnimation;
  final FlareAnimation onAnimation;
  final FlareController controller;

  @override
  _FlareSwitchState createState() => _FlareSwitchState();
}

enum FlareSwitchStates { on, off, fromOnToOff, fromOffToOn }

class _FlareSwitchState extends State<FlareSwitch> {
  bool value = false;
  final animation = StreamController<FlareSwitchStates>();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      value = widget.initialValue;
      animation.add(
          widget.initialValue ? FlareSwitchStates.on : FlareSwitchStates.off);
    } else if (widget.value != null) {
      value = value;
      animation
          .add(widget.value ? FlareSwitchStates.on : FlareSwitchStates.off);
    }
  }

  @override
  void didUpdateWidget(FlareSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != null) value = widget.value;
  }

  @override
  void dispose() {
    animation.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleValue,
      child: StreamBuilder<FlareSwitchStates>(
          stream: animation.stream,
          builder: (context, snapshot) {
            String currentAnimation;
            switch (snapshot.data) {
              case FlareSwitchStates.fromOffToOn:
                currentAnimation = widget.fromOffToOnAnimation.name;
                break;
              case FlareSwitchStates.on:
                currentAnimation = widget.onAnimation.name;
                break;
              case FlareSwitchStates.off:
                currentAnimation = widget.offAnimation.name;
                break;
              case FlareSwitchStates.fromOnToOff:
                currentAnimation = widget.fromOnToOffAnimation.name;
                break;
            }
            if (snapshot.hasData)
              return FlareActor(
                widget.path,
                fit: BoxFit.contain,
                alignment: Alignment.center,
                isPaused: widget.isPaused ?? false,
                animation: currentAnimation, //day_idle switch_night switch_day
              );
            return Text("");
          }),
    );
  }

  void toggleValue() {
    setState(() {
      if (value) {
        value = false;
        animation.add(FlareSwitchStates.fromOnToOff);
        Future.delayed(widget.fromOffToOnAnimation.duration, () {
          setState(() {
            animation.add(FlareSwitchStates.off);
          });
        });
      } else {
        value = true;
        animation.add(FlareSwitchStates.fromOffToOn);
        Future.delayed(widget.fromOffToOnAnimation.duration, () {
          setState(() {
            animation.add(FlareSwitchStates.on);
          });
        });
      }
    });
    widget.onChanged(value);
  }
}

class FlareAnimation {
  final Duration duration;
  final String name;

  FlareAnimation({@required this.duration, @required this.name});
}



class AppBloc {
  static final AppBloc _instance = AppBloc._instanciate();
  static final StreamController<ThemeData> theme$ = StreamController<ThemeData>();


  static dispose() {
    theme$.close();
  }

  factory AppBloc(){
    return _instance;
  }

  AppBloc._instanciate();

}