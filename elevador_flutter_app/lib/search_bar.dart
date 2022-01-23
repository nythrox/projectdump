import 'package:elevador_flutter_app/cliente/cliente_repository_v1.dart';
import 'package:elevador_flutter_app/equipamento/equipamento_dto.dart';
import 'package:elevador_flutter_app/equipamento/equipamento_repository_v1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'cliente/cliente_dto.dart';
import 'custom_dio.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;

  const SearchBar({Key key, this.placeholder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey[600], width: 0.5)),
      child: Row(
        children: <Widget>[
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: placeholder, border: InputBorder.none),
            ),
          ),
          SizedBox(width: 20),
          Icon(Icons.code)
        ],
      ),
    );
  }
}


abstract class HasDescription {
  final String description;

  HasDescription(this.description);
}
