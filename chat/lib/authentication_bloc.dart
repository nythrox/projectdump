import 'dart:collection';

import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc {
  
  // SharedPreferences _prefs;

  // var _authState;
  // get getAuthState => _prefs.getString('authState');

  final _authStateController = BehaviorSubject<String>();
  get authStateSink => _authStateController.sink.add;
  get authStateStream => _authStateController.stream;

  AuthenticationBloc(){
    // getDependencies();
    // authStateStream.add(getAuthState);
    // print(getAuthState);
  }

  void dispose(){
    _authStateController.close();
  }

  // setAuthState(String state) async {
  //   await _prefs.setString('authState', state);
  //   authStateSink.add(state);
  // }

  // void getDependencies() async{
  //   _prefs = await SharedPreferences.getInstance();
  //   setAuthState("Unauthenticated");
  // }

}