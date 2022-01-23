import 'package:trekkers/login/blocs/login_bloc.dart';
import 'package:trekkers/login/views/start_page.dart';
import 'package:trekkers/shared/repositories/user_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/signup/blocs/sign_up_bloc.dart';
import 'package:trekkers/widgets/theme/buttons.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  ISignUpBloc _signUpBloc;

  @override
  void initState() {
    _signUpBloc = SignUpBloc(UserRepository(CustomDio()));
    _signUpBloc.response.listen((e) {
      print("aaaaaaaaaaaaaaa $e");
    }, onError: (e) {
      showErrorDialog(e);
    });
    super.initState();
  }

  Future showCameraDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            CustomButton(
              texto: 'CAMERA',
              corbt: Color.fromRGBO(240, 225, 0, 1),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            CustomButton(
              texto: 'GALERIA',
              corbt: Color.fromRGBO(240, 225, 0, 1),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            CustomButton(
              texto: 'Cancelar',
              corbt: Color.fromRGBO(240, 225, 0, 0),
              corfont: Colors.white,
              borda: 2.0,
              bordacolor: Color.fromRGBO(255, 225, 255, 1),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background-image.jpeg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  showCameraDialog();
                },
                child: CircleAvatar(
                  radius: 55,
                  child: Center(
                    child: Icon(
                      Icons.camera_alt,
                      size: 40,
                    ),
                  ),
                ),
              ),
              rodape()
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
          TextFormField(
            validator: validateName,
            onSaved: _signUpBloc.nameEvent,
            keyboardType: TextInputType.text,
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
              hintText: 'Nome',
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: validatePhone,
            onSaved: _signUpBloc.phoneEvent,
            keyboardType: TextInputType.text,
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
              hintText: 'Celular',
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: validateEmail,
            onSaved: _signUpBloc.emailEvent,
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
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: validatePassword,
            onSaved: _signUpBloc.passwordEvent,
            keyboardType: TextInputType.text,
            obscureText: true,
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
              hintText: 'Senha',
              contentPadding: const EdgeInsets.all(8),
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rodape() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Cadastre-se',
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Quase lá! Cadastre-se e aproveite nosso App:',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                form(),
                SizedBox(
                  height: 23,
                ),
                CustomButton(
                  texto: 'CADASTRAR',
                  corbt: Color.fromRGBO(240, 225, 0, 1),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                ),
                StreamBuilder<bool>(
                  stream: _signUpBloc.loading,
                  initialData: false,
                  builder: (BuildContext context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: snapshot.hasData && snapshot.data
                          ? CircularProgressIndicator()
                          : Container(),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "Já tem uma conta?",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    texto: 'Login',
                    corbt: Color.fromRGBO(240, 225, 0, 0),
                    corfont: Colors.white,
                    borda: 2.0,
                    bordacolor: Color.fromRGBO(255, 225, 255, 1),
                    page: StartPage()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showErrorDialog(error) {
    String message =
        "Ocorreu algum erro no registro. Por favor tente novamente.";
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

String validateName(String value) {
  final name = value.trim();
  if (name.isEmpty) {
    return "Digite seu nome";
  } else if (name.length < 3) {
    return "Digite um nome válido";
  }
  return null;
}

String validatePhone(String value) {
  final phone = removeAllCharacters(value).trim();
  if (phone.isEmpty) {
    return "Digite seu telefone com o DDD";
  } else if (phone.length != 11) {
    return "Digite um nome válido";
  }
  return null;
}

String removeAllCharacters(String character) {
  return character.replaceAll(RegExp("[^0-9a-zA-Z]+"), '');
}
