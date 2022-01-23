import 'package:chat/app_service.dart';
import 'package:chat/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:chat/authentication_bloc.dart';

import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth}) : super(key: key);
  final String title;
  final AuthenticationBloc auth;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final appService = AppService();
  final controller = TextEditingController();
  LoginBloc _loginBloc;

  @override
  void initState(){
    super.initState();
    _loginBloc = LoginBloc(appService, controller, widget.auth);
  }

  @override
  void dispose(){
    // _loginBloc.dispose();
    super.dispose();
  }

  void eat_my_ass() async {
    _loginBloc.login();
    // UserModel specificUser = await appService.getUserFromName("caleb");
    // print(specificUser.name);
    // List<UserModel> users = await appService.getUsers();
    // print(users[0].name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              // TextField(
              //   obscureText: true,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: 'Password',
              //   ),
              // ),
              RaisedButton(
                onPressed: eat_my_ass,
                child: Text("Next"),
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: eat_my_ass,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
