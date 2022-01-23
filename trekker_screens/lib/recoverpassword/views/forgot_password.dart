import 'dart:io';

import 'package:dio/dio.dart';
import 'package:trekkers/recoverpassword/blocs/forgot_password_bloc.dart';
import 'package:trekkers/recoverpassword/repositories/forgot_password_repository.dart';
import 'package:trekkers/recoverpassword/views/forgot_success.dart';
import 'package:trekkers/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _forgotPasswordBloc =
      ForgotPasswordBloc(ForgotPasswordRepository(CustomDio()));

  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc.response.listen((e) => successPage(), onError: (e) {
      errorPopup(e);
    });
  }

  @override
  void dispose() {
    _forgotPasswordBloc.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[conteudo(context), rodape(context)],
        ),
      ),
    );
  }

  Widget form(context) {
    return Form(
      key: _formKey,
      child: TextFormField(
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
          contentPadding: const EdgeInsets.all(10.0),
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        onSaved: (email) {
          _forgotPasswordBloc.resetPassword(email);
        },
        validator: (e) {
          if (e.isEmpty)
            return "Digite seu e-mail";
          else if (e.contains('.') && e.contains('@'))
            return null;
          else
            return "Digite um e-mail válido";
        },
      ),
    );
  }

  Widget rodape(context) {
    return Container(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(bottom: 30, left: 30, right: 30, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Esqueci minha senha',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Por favor, digite seu e-mail ou número de telefone para recuperar sua conta.',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  form(context),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: _forgotPasswordBloc.loading,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data) {
                        return CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                  CustomButton(
                    texto: "SOLICITAR",
                    corbt: Color.fromRGBO(240, 225, 0, 1),
                    // page: ForgotSuccess()
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        /*
 Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotSuccess(),
                ),
              );
             */
                      }
                    },
                  ),
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
        border:
            Border.all(width: borda, color: Color.fromRGBO(255, 255, 255, 1)),
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
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
          },
        ),
      ),
    );
  }

  void successPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotSuccess(),
      ),
    );
  }

  void errorPopup(error) {
    String message =
        "Ocorreu um erro ao recuperar a sua senha, tente novamente mais tarde";
    if (error is DioError && error.error is SocketException) {
      message =
          "Ocorreu um erro ao efetuar seu login, verifique sua conexão e tente novamente mais tarde";
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
