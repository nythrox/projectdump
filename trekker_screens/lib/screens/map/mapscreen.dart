import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-8.913455, 13.203063),
    zoom: 17.18,
  );

  @override
  void initState() {
    super.initState();
    _addtripPoly();
  }

  void _addtripPoly() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.yellow,
      width: 5,
      points: _createTripPoints(),
      onTap: () {},
    );

    setState(() {
      polylines[polylineId] = polyline;
    });
  }

  LatLng _createLatLng(double lat, double lng) {
    return LatLng(lat, lng);
  }

  List<LatLng> _createTripPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(_createLatLng(-8.913012, 13.202450));
    points.add(_createLatLng(-8.913297, 13.202253));
    points.add(_createLatLng(-8.913752, 13.202803));
    points.add(_createLatLng(-8.913455, 13.203063));
    points.add(_createLatLng(-8.913459, 13.203063));
    points.add(_createLatLng(-8.913451, 13.203549));
    points.add(_createLatLng(-8.913424, 13.203012));
    return points;
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            width: double.infinity,
            child: GoogleMap(
              polylines: Set<Polyline>.of(polylines.values),
              mapType: MapType.normal,
              initialCameraPosition: _cameraPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (LatLng location) {},
            ),
          ),
        ],
      ),
    );
  }
}
