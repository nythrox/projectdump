import 'package:trekkers/checkin/blocs/realizado_page_bloc.dart';
import 'package:trekkers/checkin/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/checkin/repositories/checkin_participants_repository.dart';
import 'package:trekkers/checkin/views/pendente_page.dart';
import 'package:trekkers/events/models/lote.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class RealizadoPage extends StatefulWidget {
  final int id;

  const RealizadoPage({Key key, this.id}) : super(key: key);
  @override
  _RealizadoPageState createState() => _RealizadoPageState();
}

class _RealizadoPageState extends State<RealizadoPage> {

  RealizadoPageBloc _realizadoPageBloc;

  @override
  void initState() {
    super.initState();
    _realizadoPageBloc = RealizadoPageBloc(widget.id, CheckinParticipantsRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Lote>>(
        future: _realizadoPageBloc.lotes,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Text("Ocorre um erro.");
          if (snapshot.hasData && snapshot.data.isEmpty)
            return Text("Nenhum usuário se inscreveu.");
          if (snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return LoteWidget(lote: snapshot.data[i]);
              },
            );
          return CircularProgressIndicator();
        });
  }
}
