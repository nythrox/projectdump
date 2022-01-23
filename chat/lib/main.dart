import 'package:chat/app_service.dart';
import 'package:chat/authentication_bloc.dart';
import 'package:chat/homepage/home_page.dart';
import 'package:chat/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final auth = AuthenticationBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),  
      home: 
        Text("ahidi")
    );
  }
}



oldWhateaver(AuthenticationBloc auth) {
  return StreamBuilder<Object>(
        stream: auth.authStateStream,
        builder: (context, snapshot) {
          if (snapshot.data == "Authenticated") {
            return HomePage();
          }
          else {
            return LoginPage(title: "AAAAAAAAAAAAAAAAA",auth: auth,);
          }
        }
      );  
}