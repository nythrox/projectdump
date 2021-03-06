import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:trekkers/checkin/blocs/check_in_bloc.dart';
import 'package:trekkers/checkin/repositories/qrcode_repository.dart';
import 'package:trekkers/shared/components/success_page.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class CheckIn extends StatefulWidget {
  const CheckIn({Key key}) : super(key: key);
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final _checkInBloc = CheckInBloc(QrCodeRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    _checkInBloc.result.listen(
        (e) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SuccessPage(text: "Checkin realizado com sucesso!",))),
        onError: (e) => showErrorDialog(e));
  }

  @override
  void dispose() {
    _checkInBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text("CHECK-IN"),
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
          child: GestureDetector(
            onTap: () async {
              var code = await Navigator.push(
                context,
                // Create the SelectionScreen in the next step.
                MaterialPageRoute(
                    builder: (context) => SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: QrCamera(
                            qrCodeCallback: (code) {
                              Navigator.pop(context, code);
                            },
                          ),
                        )),
              );
              _checkInBloc.scanQrCode(code["userId"], code["eventId"]);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network(
                    'http://s.glbimg.com/jo/g1/f/original/2011/05/17/qrcode.jpg'),
                Padding(
                  padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Text('Servi??o de check-in no App',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16.0),
                      textAlign: TextAlign.center),
                ),
                StreamBuilder<bool>(
                  stream: _checkInBloc.loading,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data)
                      return CircularProgressIndicator();
                    return Container();
                  },
                ),
                Text(
                    'Solicite para o organizador, escanear seu \n QRcode ou digitar o c??d. pin no sistema \n para efetuar seu check in',
                    style: TextStyle(fontSize: 10.0),
                    textAlign: TextAlign.center)
              ],
            ),
          )),
    );
  }

  void showErrorDialog(error) {
    String message = "Ocorreu algum erro no checkin. Por favor tente novamente.";
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
