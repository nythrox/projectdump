
import 'package:elevador_flutter_app/search_result_section.dart';
import 'package:elevador_flutter_app/search_result_tile.dart';
import 'package:elevador_flutter_app/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'cliente/cliente_dto.dart';
import 'cliente/cliente_repository_v1.dart';
import 'custom_dio.dart';
import 'search_bar.dart';

class SearchAndChooseClientPage extends StatefulWidget {
  @override
  _SearchAndChoosePageState createState() => _SearchAndChoosePageState();
}


class ClienteSearch extends ClienteDto implements HasDescription {
  String get description => this.nome;
}

class _SearchAndChoosePageState extends State<SearchAndChooseClientPage> {
  ClienteSearch selectedResult;

  final results = ObservableFuture(ClienteRepositoryV1(CustomDio()).findAll());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SearchBar(
                placeholder: "Pesquisar por equipamento",
              ),
              SizedBox(height: 20),
              SearchResultSection(
                title: "Recentes",
                children: <Widget>[],
              ),
              SizedBox(height: 20),
              Observer(builder: (c) {
                if (results.status == FutureStatus.fulfilled) {
                  return SearchResultSection(
                    title: "Resultados",
                    children: results.value
                        .map((e) => SearchResultTile<ClienteSearch>(
                              result: e,
                              onSelected: (e) => setState(() {
                                selectedResult = e;
                              }),
                            ))
                        .toList(),
                  );
                }
                if (results.status == FutureStatus.rejected) {
                  return Center(
                    child: Text(results.error.toString()),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ],
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ThemeButton(
              color: Colors.grey[200],
              textColor: Colors.black,
              title: 'Cancelar',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ThemeButton(
                color: Colors.blue,
                title: "Próximo",
                onPressed: () {
                  Navigator.pop(context, selectedResult);
                }),
          ],
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
