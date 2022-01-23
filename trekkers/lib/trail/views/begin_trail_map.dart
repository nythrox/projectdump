import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trekkers/shared/components/menu.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/trail/blocs/begin_trail_map.dart';
import 'package:trekkers/trail/repositories/trail_repository.dart';

class BeginTrailMap extends StatefulWidget {
  const BeginTrailMap({Key key}) : super(key: key);
  @override
  _BeginTrailMapState createState() => _BeginTrailMapState();
}

class _BeginTrailMapState extends State<BeginTrailMap> {
  BeginTrailMapBloc _beginTrailMapBloc;
  bool started = false;

  @override
  void initState() {
    _beginTrailMapBloc = BeginTrailMapBloc(TrailRepository(CustomDio()));
    super.initState();
  }

  @override
  void dispose() {
    _beginTrailMapBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "INICIAR TRILHA",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: started
          ? BottomAppBar(
              color: Colors.white,
              child: Container(
                height: 70.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            onPressed: () {},
                            color: //!stopwatchCounter.stopwatch.isRunning
                                //  ? Colors.amber[600]
                                // :
                                Colors.red[900],
                            child: Text(
                              // stopwatchCounter.stopwatch.isRunning
                              //  ?
                              //  "PAUSAR"
                              //:
                              "RETOMAR",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ))),
                    SizedBox(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {},
                        color: Colors.lightGreen[500],
                        child: Text("FINALIZAR",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0)),
                      ),
                    ),
                  ],
                ),
              ))
          : null,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("02:30",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400)),
                Text("Duração",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400)),
                Container(
                  padding: EdgeInsets.only(top: 7.0),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {},
                    color: Colors.yellowAccent[700],
                    child: Text("ESTATÍSTICAS",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(45.521563, -122.677433),
                    zoom: 11.0,
                  ),
                ),
                if (!started)
                  Positioned(
                    bottom: -30,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          started = !started;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 35,
                        child: Center(
                          child: Text("INICIAR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!started) SizedBox(height: 70)
        ],
      ),
    );
  }
}

/*
Stack(
          
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(45.521563, -122.677433),
                  zoom: 11.0,
                ),
              ),
            ),
            if (!started)
              CircleAvatar(
                backgroundColor: Colors.red,
                radius: 30,
                child: Center(
                  child: Text("ESTATÍSTICAS",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("02:30",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w400)),
                  Text("Duração",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400)),
                  Container(
                    padding: EdgeInsets.only(top: 7.0),
                    height: 40.0,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      color: Colors.yellowAccent[700],
                      child: Text("ESTATÍSTICAS",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
*/
