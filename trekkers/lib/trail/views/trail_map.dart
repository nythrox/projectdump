import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/trail/blocs/trail_map_bloc.dart';
import 'package:trekkers/trail/repositories/trail_repository.dart';
import 'package:trekkers/trail/views/begin_trail_map.dart';

class TrailMap extends StatefulWidget {
  @override
  _TrailMapState createState() => _TrailMapState();
}

class _TrailMapState extends State<TrailMap> {
  final _trailMapBloc = TrailMapBloc(TrailRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    _trailMapBloc.result.listen((result) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BeginTrailMap()));
    }, onError: (e) => showErrorDialog(e));
  }

  @override
  void dispose() {
    _trailMapBloc.dispose();
    super.dispose();
  }

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
          Center(
            child: StreamBuilder(
              stream: _trailMapBloc.loading,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data == true)
                  return CircularProgressIndicator();
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  void showErrorDialog(error) {
    String message = "Ocorreu algum erro. Por favor, tente novamente.";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
