import 'package:trekkers/checkin/blocs/pendente_page_bloc.dart';
import 'package:trekkers/checkin/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/checkin/repositories/checkin_participants_repository.dart';
import 'package:trekkers/events/models/lote.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class PendentePage extends StatefulWidget {
  final int id;

  const PendentePage({Key key, this.id}) : super(key: key);

  @override
  _PendentePageState createState() => _PendentePageState();
}

class _PendentePageState extends State<PendentePage> {
  PendentePageBloc _pendentePageBloc;

  @override
  void initState() {
    super.initState();
    _pendentePageBloc =
        PendentePageBloc(widget.id, CheckinParticipantsRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Lote>>(
        future: _pendentePageBloc.lotes,
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

class LoteWidget extends StatelessWidget {
  const LoteWidget({
    Key key,
    this.lote,
  }) : super(key: key);

  final Lote lote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            lote.description,
            style: TextStyle(fontSize: 18.0, color: Colors.black54),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CustomListTile(
                  lote.users[index].userAvatar,
                  lote.users[index].userName,
                  lote.description,
                  Colors.green);
            },
          ),
        )
      ],
    );
  }
}
