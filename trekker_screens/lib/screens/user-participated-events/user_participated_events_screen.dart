import 'package:trekkers/events/blocs/event_bloc.dart';
import 'package:trekkers/events/blocs/ievent_bloc.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/repositories/event_category_repository.dart';
import 'package:trekkers/events/repositories/event_repository.dart';
import 'package:trekkers/events/views/ver_evento.dart';
import 'package:trekkers/screens/user-participated-events/bloc/user_participated_events_screen_bloc.dart';
import 'package:trekkers/screens/user-participated-events/models/event_user_participated.dart';
import 'package:trekkers/screens/user-participated-events/repositories/user_events_repository.dart';
import 'package:trekkers/screens/user_participated_events_tile.dart';
import 'package:trekkers/shared/components/category_page.dart';
import 'package:trekkers/shared/components/event_tile.dart';
import 'package:trekkers/shared/components/menu.dart';
import 'package:trekkers/shared/models/category.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:trekkers/widgets/nenhum_registro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// cores
//amarelo opaco, usado na bottomBar
const opaqueYellow = Color.fromRGBO(247, 183, 44, 1);

// amarelo tema do app
const yellow = Color.fromRGBO(249, 250, 57, 1);

//

class UserParticipatedEventsScreen extends StatefulWidget {
  const UserParticipatedEventsScreen({Key key, this.id}) : super(key: key);
  final id;
  @override
  _UserParticipatedEventsScreenState createState() =>
      _UserParticipatedEventsScreenState();
}

class _UserParticipatedEventsScreenState
    extends State<UserParticipatedEventsScreen> {
  UserParticipatedEventsScreenBloc _userParticipatedEventsScreenBloc;

  @override
  void initState() {
    _userParticipatedEventsScreenBloc = UserParticipatedEventsScreenBloc(
        widget.id,
        UserEventsRepository(
          CustomDio(),
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EVENTOS",
          style: TextStyle(fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<EventUserParticipated>>(
        future: _userParticipatedEventsScreenBloc.eventUserParticipated,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
                child: Text("Ocorreu um erro. Por favor, tente novamente."));
          if (snapshot.hasData)
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, index) {
                return UserParticipatedEventTile(
                  onTap: () {},
                  eventUserParticipated: snapshot.data[index],
                );
              },
            );
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
