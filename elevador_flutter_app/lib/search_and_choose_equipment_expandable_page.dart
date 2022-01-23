import 'package:elevador_flutter_app/equipamento/equipamento_repository_v1.dart';
import 'package:elevador_flutter_app/search_result_checkbox_tile.dart';
import 'package:elevador_flutter_app/search_result_expandable_checkbox_tile.dart';
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
  EquipamentosSearch({
    ativo,
    descricao,
    fabricante,
    id,
    tipo,
  }) : super(
            ativo: ativo,
            descricao: descricao,
            fabricante: fabricante,
            id: id,
            tipo: tipo);
  String get description => this.descricao;
}

class SearchAndChooseEquipmentExpandablePage extends StatefulWidget {
  @override
  _SearchAndChooseEquipmentExpandablePageState createState() =>
      _SearchAndChooseEquipmentExpandablePageState();
}

class _SearchAndChooseEquipmentExpandablePageState
    extends State<SearchAndChooseEquipmentExpandablePage> {
  List<List<EquipamentosSearch>> results = [
    [
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1)
    ],
    [
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1),
      EquipamentosSearch(descricao: "Fio/Terminal/Conector", id: 1)
    ],
  ];
  List<EquipamentosSearch> selectedResults = [];
  @override
  Widget build(BuildContext context) {
    int i = 1;
    int subI = 1;
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
                title: "Resultados",
                children: results.map((e) {
                  final w = SearchResultExpandableCheckboxTileContainer<
                      EquipamentosSearch>(
                    title: "$i. Quadro de comando",
                    children: e.map((e) {
                      final w = SearchResultNumberedTile<EquipamentosSearch>(
                          number: i + (0.1 * subI),
                          isSelected: selectedResults.contains(e),
                          onSelected: (e) => setState(() {
                                selectedResults.add(e);
                                print("changed");
                              }),
                          onUnselected: (e) =>
                              setState(() => selectedResults.remove(e)),
                          result: e);
                      subI++;
                      return w;
                    }).toList(),
                  );
                  i++;
                  return w;
                }).toList(),
              )
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
                  Navigator.pop(context, selectedResults);
                }),
          ],
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
