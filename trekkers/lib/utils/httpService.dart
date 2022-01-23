import 'package:trekkers/utils/network/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  List data = [];
  static final HttpService _singleton = HttpService._internal();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal();

  final authorizationEndpoint =
      Uri.parse('${NetworkUtils.urlBase}${NetworkUtils.tokenEndpoint}');

  Future<String> getMobileToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> _setMobileToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future getClient() async {
    var _mobileToken = await getMobileToken();

    if (_mobileToken.isEmpty) {
      throw "Couldn't get user";
    } else {
      return true;
    }
  }

  Future<String> setClient(username, password) async {
    print('username ' + username);
    print('password ' + password);
    var url = '${NetworkUtils.urlApi}auth/login';
    var response =
        await http.post(url, body: {"email": username, "password": password});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      await _setMobileToken('Bearer ' + data['access_token']);

      var token = await getMobileToken();

      print('Response token: $token');
      return token;
    } else {
      return null;
    }
  }

  void closeClient(client) async {
    await _setMobileToken(jsonEncode(client.credentials.toJson()));

    client.close();
  }

  Future<bool> ensureLoggedIn() async {
    try {
      await getClient();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> logout() async {
    if (await ensureLoggedIn()) {
      final pref = await SharedPreferences.getInstance();
      await pref.clear();
    }
  }
}
