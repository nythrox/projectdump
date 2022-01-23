import 'dart:convert';

import 'package:elevador_flutter_app/carreagr_formulario_payload.dart';
import 'package:elevador_flutter_app/search_and_choose_client.dart';
import 'package:elevador_flutter_app/search_and_choose_equipment_expandable_page.dart';
import 'package:flutter/material.dart';
import 'alternar_equipamento_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final formulario = CarregarFormularioPayload.fromJson(jsonDecode("""{
  "listaPrincipais": [
    {
      "id": 1,
      "descricao": "Pavimento",
      "subItens": [
        {
          "id": 5,
          "descricao": "Botoeiras de chamada",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
          
        },
        {
          "id": 6,
          "descricao": "Indicadores de posição e ou direção",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 7,
          "descricao": "Portas",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 8,
          "descricao": "Amortecedores, ditadores e afins",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 9,
          "descricao": "Trincos, fechos, dispositivo eletromecânico de travamento",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 10,
          "descricao": "Soleiras, trilhos",  "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 11,
          "descricao": "Outros acessórios existentes não listados",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "id": 2,
      "descricao": "Cabina",
      "subItens": [
        {
          "id": 12,
          "descricao": "Intercomunicador exclusivo do sistema elevador",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 13,
          "descricao": "Alarme",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 14,
          "descricao": "Interfone do sistema de comunicação do prédio",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 15,
          "descricao": "Botões em geral",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        },
        {
          "id": 16,
          "descricao": "Conforto da viagem",
          "grupos": [
            {
              "id": 1,
              "descricao": "Ação Realizada",
              "opcoes": [
                {
                  "id": 1,
                  "descricao": "Inpecionado"
                },
                {
                  "id": 2,
                  "descricao": "Ajudado/Regulado"
                },
                {
                  "id": 3,
                  "descricao": "Testado"
                },
                {
                  "id": 4,
                  "descricao": "Não verificado"
                },
                {
                  "id": 5,
                  "descricao": "Lubrificado"
                },
                {
                  "id": 6,
                  "descricao": "Limpo"
                },
                {
                  "id": 7,
                  "descricao": "Não se aplica"
                }
              ]
            },
            {
              "id": 2,
              "descricao": "Situação Pós-Preventiva",
              "opcoes": [
                {
                  "id": 8,
                  "descricao": "Satisfatório"
                },
                {
                  "id": 9,
                  "descricao": "Insatisfatório"
                },
                {
                  "id": 10,
                  "descricao": "Programar substituição de peça(s)"
                },
                {
                  "id": 11,
                  "descricao": "Programar serviço(s)"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}"""));


class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: FormularioBuilder(formulario),
      body: SearchAndChooseEquipmentExpandablePage(),
    );
  }
}


class FormularioBuilder extends StatelessWidget {
  final CarregarFormularioPayload formularioDto;

  const FormularioBuilder(this.formularioDto, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CurrentEquipmentWidget(
          title: "Elevador Social - Torre 1",
          subtitle: "Equipamento 1 / 2",
        ),
        ...formulario.listaPrincipais
            .map((
              e,
            ) =>
                CheckListTile(
                    initiallyExpanded: true,
                    title: e.descricao,
                    children: e.subItens
                        .map(
                          (e) => AvaliacaoTarefa(
                              title: e.descricao,
                              children: e.grupos
                                  .map((grupo) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: AvaliacaoDropdown(
                                          title: grupo.descricao,
                                          options: grupo.opcoes
                                              .map((opcao) => opcao.descricao)
                                              .toList(),
                                        ),
                                      ))
                                  .toList()),
                        )
                        .toList()))
            .toList()
      ],
    );
  }
}

class AvaliacaoDropdown extends StatefulWidget {
  final List<String> options;
  final String title;
  const AvaliacaoDropdown({Key key, this.options, this.title})
      : super(key: key);

  @override
  _AvaliacaoDropdownState createState() => _AvaliacaoDropdownState();
}

class _AvaliacaoDropdownState extends State<AvaliacaoDropdown> {
  String value;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[200], width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton<String>(
            underline: Container(),
            hint: Text("Escolha aqui..."),
            style: TextStyle(fontSize: 14, color: Colors.black),
            isExpanded: true,
            value: value,
            items: widget.options
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: (e) => setState(() {
                  value = e;
                })),
      )
    ]);
  }
}

class AvaliacaoTarefa extends StatelessWidget {
  final String descricao;
  final String title;
  final List<Widget> children;

  const AvaliacaoTarefa(
      {Key key, this.descricao, @required this.children, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Text(
                  descricao ??
                      "Partida lenta provavelmetne causada por problema no chip...",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  size: 30,
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          ...children
        ],
      ),
    );
  }
}

class CheckListTile extends StatefulWidget {
  final List<Widget> children;
  final String title;
  final Widget image;
  final bool initiallyExpanded;
  const CheckListTile(
      {Key key,
      this.children,
      this.title,
      this.image,
      this.initiallyExpanded = false})
      : super(key: key);

  @override
  _CheckListTileState createState() => _CheckListTileState();
}

class _CheckListTileState extends State<CheckListTile> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (e) => setState(() {
        isActive = e;
      }),
      initiallyExpanded: widget.initiallyExpanded,
      leading: widget.image ??
          Container(
            decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4)),
            width: 40,
            height: 40,
            child: Icon(Icons.camera, color: Colors.white),
          ),
      title: Row(
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                NumeroAcoes(
                  isActive: isActive,
                  totalAcoes: widget.children.length,
                  acoesRealizadas: 0,
                )
              ],
            ),
          ),
        ],
      ),
      children: [
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) => widget.children[i],
            separatorBuilder: (context, i) => Divider(),
            itemCount: widget.children.length)
      ],
    );
  }
}

class NumeroAcoes extends StatelessWidget {
  final int totalAcoes;
  final int acoesRealizadas;
  final bool isActive;

  const NumeroAcoes(
      {Key key,
      @required this.totalAcoes,
      @required this.acoesRealizadas,
      @required this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: isActive ? Colors.blue : Colors.grey,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        child: Text(
          "$acoesRealizadas / $totalAcoes",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
