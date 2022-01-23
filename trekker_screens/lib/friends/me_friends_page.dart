import 'package:rxdart/rxdart.dart';
import 'package:trekkers/friends/friend_tile.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/friends/repositories/friends_repository.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

import 'blocs/me_friends_page_bloc.dart';
import 'models/friend.dart';

class MeFriendsPage extends StatefulWidget {
  @override
  _MeFriendsPageState createState() => _MeFriendsPageState();
}

class _MeFriendsPageState extends State<MeFriendsPage> {
  MeFriendsPageBloc _meFriendsPageBloc;

  @override
  void initState() {
    super.initState();
    _meFriendsPageBloc = MeFriendsPageBloc(FriendsRepository(CustomDio()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Expanded(
          child: FutureBuilder<List<Friend>>(
              future: _meFriendsPageBloc.friends,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                if (snapshot.hasData) {
                  if (snapshot.data.isEmpty) {
                    return Text("Você ainda não adicionou nenhum amigo.");
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return FriendTile(
                          snapshot.data[index].avatar,
                          snapshot.data[index].name,
                          "NÃO SEI OQ BOTAR AQ",
                          80,
                          Colors.greenAccent[400]);
                    },
                  );
                }
                return CircularProgressIndicator();
              }),
        ),
      ],
    );
  }
}
