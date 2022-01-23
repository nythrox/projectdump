import 'package:trekkers/events/views/events_screen.dart';
import 'package:trekkers/login/views/login_page.dart';
import 'package:trekkers/shared/components/custom_button.dart';
import 'package:trekkers/signup/views/cadstre_se.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background-image.jpeg'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Expanded(flex: 2, child: conteudo()),
                      Expanded(flex: 3, child: rodape()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget conteudo() {
    return Container(
      child: SizedBox(
          child: Center(child: Image.asset('assets/images/logo.png')),
          height: 150,
          width: 150),
    );
  }

  Widget rodape() {
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bem Vindo!',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Use seu e-mail ou login com facebook para continuar',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomButton(
                texto: 'LOGIN COM SEU E-MAIL',
                corbt: Color.fromRGBO(240, 225, 0, 1),
                corfont: Colors.black,
                page: const LoginPage(),
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomButton(
                texto: 'LOGIN COM FACEBOOK',
                corbt: Color.fromRGBO(66, 103, 178, 1),
                corfont: Colors.white,
                page: const EventsScreen(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 13),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: const Text(
                    "Precisa de uma conta ?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CustomButton(
                texto: 'Cadastre-se',
                corbt: const Color.fromRGBO(240, 225, 0, 0),
                corfont: Colors.white,
                borda: 2.0,
                bordacolor: Color.fromRGBO(255, 255, 255, 1),
                page: SignUpPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
