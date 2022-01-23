import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BeginTrailMap extends StatefulWidget {
  @override
  _BeginTrailMapState createState() => _BeginTrailMapState();
}

class _BeginTrailMapState extends State<BeginTrailMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            "INICIAR TRILHA",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomAppBar(
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.0),
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
            )),
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(45.521563, -122.677433),
                  zoom: 11.0,
                ),
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
        ));
  }
}
