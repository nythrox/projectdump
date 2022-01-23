import 'package:chat/app_service.dart';
import 'package:chat/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc {
  final AuthenticationBloc auth;
  final AppService repository;
  final TextEditingController controller;

  LoginBloc(this.repository, this.controller, this.auth);

  Future<bool> login() async{
    try {
      final user = await repository.getUserFromName(controller.text);
      auth.authStateSink("Authenticated");
      return true;
    }
    catch (ex) {
      print(ex);
      return false;
    }
  }
























  // final _emailController = BehaviorSubject<String>();
  // get emailSink => _emailController.sink.add;
  // get emailStream => _emailController.stream.transform;

  // final _passwordController = BehaviorSubject<String>();
  // get passwordSink => _passwordController.sink.add;
  // get passwordStream => _passwordController.stream;

  // validateEmail(){
  //   return "true";
  // }

  // @override
  // void dispose(){
  //   _emailController.close();
  //   _passwordController.close();
  // }

}