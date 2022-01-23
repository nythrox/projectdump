import 'dart:io';
import 'package:trekkers/events/views/events_screen.dart';
import 'package:trekkers/login/blocs/login_bloc.dart';
import 'package:trekkers/main.dart';
import 'package:trekkers/progress/progress_page.dart';
import 'package:trekkers/recoverpassword/views/forgot_password.dart';
import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/models/iuser.dart';
import 'package:trekkers/shared/repositories/user_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/shared/utils/store.dart';
import 'package:trekkers/signup/views/cadstre_se.dart';
import 'package:trekkers/widgets/theme/buttons.dart';
import 'package:trekkers/widgets/theme/textfields.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//DEPENDENCIAS
class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ILoginBloc _loginBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc(
      UserRepository(
        CustomDio(),
      ),
      SharedPreferencesTokenStore(),
    );

    _loginBloc.currentUser.listen(onSuccess, onError: onError);

    super.initState();
  }

  void x(Widget Function() x) {}

  @override
  void dispose() {
    //_loginBloc.dispose();
    super.dispose();
  }

  void onSuccess(User user) {
    final authBloc = AuthenticationProvider.of(context).authenticationBloc;
    authBloc.userEvent(user);
//  '/': (context) => ProgressPage(),
    Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => ProgressPage()), (e) => false);
  }

  void onError(error, stack) {
    String message;
    if (error is AuthenticationException) {
      message = "E-mail ou senha incorretos por favor tente novamente!";
    } else if (error is DioError && error.error is SocketException) {
      message =
          "Ocorreu um erro ao efetuar seu login, verifique sua conexão e tente novamente mais tarde";
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background-image.jpeg'))),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 120,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Bem Vindo!',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          const Text(
                            'Faça seu login abaixo.',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    form(),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      texto: 'LOGIN',
                      corbt: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()),
                        );
                      },
                      child: const Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Esqueceu a senha?",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Precisa de uma conta?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        texto: 'Cadastre-se',
                        corbt: Color.fromRGBO(240, 225, 0, 0),
                        corfont: Colors.white,
                        borda: 2.0,
                        bordacolor: Color.fromRGBO(255, 255, 255, 1),
                        page: SignUpPage()),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: StreamBuilder<bool>(
                          initialData: false,
                          stream: _loginBloc.loading,
                          builder: (context, snapshot) {
                            final loading = snapshot.hasData && snapshot.data;
                            return Visibility(
                              visible: loading,
                              child: const SizedBox(
                                width: 60,
                                height: 60,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          CustomTextFormField(
              onSaved: _loginBloc.emailEvent,
              hintText: "E-mail",
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            onSaved: _loginBloc.passwordEvent,
            hintText: "Senha",
            obscureText: true,
            validator: validatePassword,
          ),
        ],
      ),
    );
  }
}
