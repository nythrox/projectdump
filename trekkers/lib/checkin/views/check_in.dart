import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:trekkers/checkin/blocs/check_in_bloc.dart';
import 'package:trekkers/checkin/repositories/qrcode_repository.dart';
import 'package:trekkers/shared/components/success_page.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class CheckinScannerPage extends StatefulWidget {
  const CheckinScannerPage({Key key}) : super(key: key);
  @override
  _CheckinScannerPageState createState() => _CheckinScannerPageState();
}

class _CheckinScannerPageState extends State<CheckinScannerPage> {
  final _checkInBloc = CheckInBloc(QrCodeRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    _checkInBloc.result.listen(
        (e) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SuccessPage(
                      text: "Checkin realizado com sucesso!",
                    ))),
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
      backgroundColor: Color(0xff7a7b80),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Padding(
          padding: EdgeInsets.only(top: 5.0, left: 70.0, right: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Escanear",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              Text("Escanear código do atleta",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: Colors.white),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 260,
                  height: 260,
                  child: QrCamera(
                    notStartedBuilder: (context) => CircularProgressIndicator(),
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (String code) {
                      print(code);

                      try {
                        //   _checkInBloc.scanQrCode(
                        //    code['userId'], code["eventId"]);
                      } catch (e) {
                        print(e);
                        // showErrorDialog(e);
                      }
                    },
                  ),
                ),
              ),
              // Image.network(
              //     'http://s.glbimg.com/jo/g1/f/original/2011/05/17/qrcode.jpg'),
              Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Text('Serviço de check-in no App',
                    style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 16.0),
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
                  'Solicite para o organizador, escanear seu \n QRcode ou digitar o cód. pin no sistema \n para efetuar seu check in',
                  style: TextStyle(fontSize: 10.0),
                  textAlign: TextAlign.center)
            ],
          )),
    );
  }

  void showErrorDialog(error) {
    String message =
        "Ocorreu algum erro no checkin. Por favor tente novamente.";
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
