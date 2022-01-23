import 'package:chat/app_service.dart';
import 'package:chat/authentication_bloc.dart';
import 'package:chat/login/login_page.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = AppService();
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    users = await service.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YOOOOOOOOOO, YOOOOOOOOOOOOOO? YOOOOOOOOOOOOOOOOO"),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (BuildContext ctxt, int i) {
          if (!users.isEmpty || users != null) {
            return Text(users[i].name);
          } else {
            return CircularProgressIndicator();
          }
        },
        itemCount: users.length,
      )),
    );
  }
}
