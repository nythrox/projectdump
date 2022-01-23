
import 'package:elevador_flutter_app/equipamento/equipamento_repository_v1.dart';
import 'package:elevador_flutter_app/search_result_checkbox_tile.dart';
import 'package:elevador_flutter_app/search_result_section.dart';
import 'package:elevador_flutter_app/theme_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'custom_dio.dart';
import 'equipamento/equipamento_dto.dart';
import 'search_bar.dart';

class EquipamentosSearch extends EquipamentoDto implements HasDescription {
  String get description => this.descricao;
}

class SearchAndChooseEquipmentPage extends StatefulWidget {
  @override
  _SearchAndChooseEquipmentPageState createState() =>
      _SearchAndChooseEquipmentPageState();
}

class _SearchAndChooseEquipmentPageState
    extends State<SearchAndChooseEquipmentPage> {
  EquipamentosSearch selectedResult;

  final results =
      ObservableFuture(EquipamentoRepositoryV1(CustomDio()).findAll());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SearchBar(
                placeholder: "Pesquisar por cliente",
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
                        .map(
                            (e) => SearchResultCheckboxTile<EquipamentosSearch>(
                                  isSelected: e == selectedResult,
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