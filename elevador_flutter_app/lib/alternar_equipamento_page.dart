import 'package:flutter/material.dart';

class AlternarEquipamentoPage extends StatefulWidget {
  final List<String> options;

  const AlternarEquipamentoPage({Key key, @required this.options}) : super(key: key);

  @override
  _AlternarEquipamentoPageState createState() =>
      _AlternarEquipamentoPageState();
}

class _AlternarEquipamentoPageState extends State<AlternarEquipamentoPage> {
  String currentOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escolher equipamento")),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context, currentOption);
      },child: Icon(Icons.navigate_next),),
      body: ListView(
          children: widget.options
              .map((e) => CheckboxListTile(
                    title: Text(e),
                    value: currentOption == e,
                    onChanged: (bool value) {
                      setState(() {
                        currentOption = e;
                      });
                    },
                  ))
              .toList()),
    );
  }
}
