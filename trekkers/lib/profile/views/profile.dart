import 'package:trekkers/main.dart';
import 'package:trekkers/profile/views/profile_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(
          "PERFIL",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: menu(),
    );
  }

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ListView(
        children: <Widget>[
          profile(),
          menuItem('Amigos', 'Encontre amigos na Comunidade', '/amigos'),
          menuItem('Medalhas', 'Visualize nosso mural de medalhas', '/events'),
          menuItem('Ingressos', 'Encontre seus ingressos', '/events'),
          menuItem('Estatisticas', 'Visualize suas estatisticas', '/events'),
          menuItem('Progresso', 'Visualize seu progresso', '/profile'),
        ],
      ),
    );
  }

  Widget menuItem(_title, _text, _route) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          dense: true,
          title: Text(
            _title,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Quick',
                fontSize: 15.0,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            _text,
            style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Quick',
                fontWeight: FontWeight.w600),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 12,
          ),
          onTap: () => {
            Navigator.of(context).pushNamedAndRemoveUntil(
                _route, (Route<dynamic> route) => false),
          },
        ),
        Divider(
          height: 3.0,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget profile() {
    final user =
        AuthenticationProvider.of(context).authenticationBloc.user.value;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileDetailPage(),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: 'profile',
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(user?.avatar ??
                            "https://pbs.twimg.com/profile_images/438358752098410496/LwJ650oh_400x400.jpeg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${user?.name}',
                          style: TextStyle(
                              fontFamily: 'Quick',
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cascavel - PR',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Quick',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  /*
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text('Saldo - R\$ 150,00',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400)),
                  )
                  */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
