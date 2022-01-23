import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrailMap extends StatefulWidget {
  @override
  _TrailMapState createState() => _TrailMapState();
}

class _TrailMapState extends State<TrailMap> {
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
      floatingActionButton: Container(
        height: 105.0,
        width: 105.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.lightGreenAccent[700],
            onPressed: () {},
            child: Text(
              "INICIAR",
              style: TextStyle(
                  fontSize: 8.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 75.0,
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1.1,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(45.521563, -122.677433),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
