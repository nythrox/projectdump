import 'package:trekkers/login/views/start_page.dart';
import 'package:trekkers/widgets/theme/buttons.dart';
import 'package:flutter/material.dart';

class ForgotSuccess extends StatefulWidget {
  @override
  _ForgotSuccessState createState() => _ForgotSuccessState();
}

class _ForgotSuccessState extends State<ForgotSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[conteudo(context), rodape(context)],
      ),
    );
  }
}

Widget conteudo(context) {
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: SizedBox(
        child: Image.asset('assets/images/logo.png'),
        height: 130,
        width: 130),
  );
}

Widget form(context) {
  return Column(
    children: <Widget>[
      TextField(
        // controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24, width: 1.0),
          ),
          hintText: 'E-mail',
          contentPadding: const EdgeInsets.all(15.0),
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    ],
  );
}

Widget rodape(context) {
  return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        // deixar a coluna com altura 100%
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          recorteRodape(context),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(44, 44, 44, 1)),
            padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.check_circle,
                    size: 80, color: Color.fromRGBO(240, 225, 0, 1)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Successo',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Uma nova senha será enviada para \n seu e-mail cadastrado.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    texto: 'LOGIN',
                    corbt: Color.fromRGBO(240, 225, 0, 0),
                    corfont: Colors.white,
                    borda: 2.0,
                    bordacolor: Color.fromRGBO(255, 255, 255, 1),
                    page: StartPage()),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget botao(context, _texto, _corbt, _corfont, borda) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: _corbt,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      border: Border.all(width: borda, color: Color.fromRGBO(255, 255, 255, 1)),
    ),
    child: SizedBox.expand(
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _texto,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _corfont,
                fontSize: 18,
              ),
            ),
          ],
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => ForgotSuccess(),
          //   ),
          // );
        },
      ),
    ),
  );
}

Widget recorteRodape(context) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: Colors.transparent,
      image: DecorationImage(
        image: AssetImage('assets/images/recorte.png'),
        alignment: Alignment(0.45, 1),
        fit: BoxFit.contain,
      ),
    ),
  );
}
