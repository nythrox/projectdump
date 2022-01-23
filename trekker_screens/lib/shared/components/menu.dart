import 'package:trekkers/app/blocs/authentication_bloc.dart';
import 'package:trekkers/main.dart';
import 'package:trekkers/profile/views/profile.dart';
import 'package:trekkers/shared/models/admin.dart';
import 'package:trekkers/shared/models/iuser.dart';
import 'package:flutter/material.dart';
import 'package:trekkers/utils/httpService.dart';

class MenuDrawer extends StatefulWidget {
  final bool isAdmin;

  const MenuDrawer({Key key, this.isAdmin = false}) : super(key: key);
  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  IAuthenticationBloc _authenticationBloc;

  @override
  void didChangeDependencies() {
    _authenticationBloc = AuthenticationProvider.of(context).authenticationBloc;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
            decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ));

    return Drawer(child: Stack(children: <Widget>[_buildDrawerBack(), menu()]));
  }

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 40.0, right: 16.0),

      child: StreamBuilder<User>(
          initialData: _authenticationBloc.user.value,
          stream: _authenticationBloc.user,
          builder: (context, snapshot) {
            final user = snapshot.data;
            final isAdmin = snapshot.data is Admin;
            return ListView(
              children: <Widget>[
                UserCirle(
                  name: user.name,
                  subtitle: user.avatar,
                  url: user.avatar ??
                      "https://pbs.twimg.com/profile_images/438358752098410496/LwJ650oh_400x400.jpeg",
                ),
                MenuItem(
                    title: 'Eventos',
                    text: 'Saiba qual será o próximo evento',
                    route: '/eventos'),
                MenuItem(
                    title: 'Medalhas',
                    text: 'Visualize nosso mural de medalhas',
                    route: '/medals'),
                MenuItem(
                    title: 'Loja',
                    text: 'Confira nossos produtos',
                    route: '/store'),
                if (isAdmin)
                  MenuItem(
                      title: 'Meu check-in',
                      text: 'Confirme sua presença neste evento',
                      route: '/check_in'),
                MenuItem(
                    title: 'Notícias',
                    text: 'Fique por dentro das últimas notícias',
                    route: '/noticias'),
                titleDivider('Minha conta'),
                MenuItem(
                    title: 'Perfil',
                    text: 'Visualize seu perfil',
                    route: '/profile'),
                MenuItem(
                    title: 'Iniciar trilha',
                    text: 'Clique aqui para iniciar a trilha',
                    route: '/check_in'),
                if (!isAdmin)
                  MenuItem(
                      title: 'Check-in',
                      text: 'Confirme a presença do atleta',
                      route: '/check_in'),
                if (isAdmin) ...[
                  titleDivider('Administrativo'),
                  MenuItem(
                      title: 'Check-in',
                      text: 'Confirme a presença do atleta',
                      route: '/check_in'),
                  MenuItem(
                      title: 'Vender',
                      text: 'Vender produtos pessoalmente',
                      route: '/eventos'),
                  MenuItem(
                      title: 'Pedidos',
                      text: 'Visualize os pedidos',
                      route: '/eventos'),
                ],
                sair(),
              ],
            );
          }),
      // ),
    );
  }

  Widget titleDivider(title) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40.0, left: 15.0, bottom: 20.0),
          child: Text(title.toUpperCase(),
              style: TextStyle(color: Colors.grey[600])),
        ),
      ],
    );
  }

  Widget sair() {
    return Column(
      children: <Widget>[
        ListTile(
          dense: true,
          title: Text(
            'Sair'.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 12,
          ),
          onTap: () async => {
            await HttpService().logout(),
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
          },
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final String text;
  final String route;

  const MenuItem({Key key, this.title, this.text, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
          dense: true,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            text,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 12,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(route);
          },
        ),
        Divider(
          height: 3.0,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class UserCirle extends StatelessWidget {
  final String url;
  final String name;
  final String subtitle;

  const UserCirle({Key key, this.url, this.name, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, bottom: 10.0),
      child: Container(
        child: GestureDetector(
            onTap: () async {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(url),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            name,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            subtitle,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
