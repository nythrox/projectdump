import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiUrl {
  final String url;
  final String key;
  final bool auth;

  ApiUrl(this.url, this.key, this.auth);
}

typedef apiUrlDefault = Future<Map> Function();
typedef apiUrlId = Future<Map> Function(int id);

class API {
  static Future<Map> getEventsCategories() async {
    var url = 'https://trekkers.sevenclicks.us/api/categories/type/eventos';
    var response = await http
        .get(url, headers: {"Authorization": "", "Accept": "application/json"});
    return json.decode(response.body);
  }

  static Future<Map> getEvents(int idCategory) async {
    //var token = await HttpService().getMobileToken();

    var url = 'https://trekkers.sevenclicks.us/api/events/' +
        (idCategory == 0 ? "" : "category/" + idCategory.toString());

    print(url);
    var response = await http
        .get(url, headers: {"Authorization": "", "Accept": "application/json"});

    return json.decode(response.body);
  }

  static Future<Map> getProductCategories() async {
    var url = 'https://trekkers.sevenclicks.us/api/categories/type/produtos';
    var response = await http
        .get(url, headers: {"Authorization": "", "Accept": "application/json"});
    return json.decode(response.body);
  }

  static Future<Map> getProducts(int idCategory) async {
    var url = 'https://trekkers.sevenclicks.us/api/products/' +
        (idCategory == 0 ? "" : "category/" + idCategory.toString());

    print(url);
    var response = await http
        .get(url, headers: {"Authorization": "", "Accept": "application/json"});

    return json.decode(response.body);

  }
}
