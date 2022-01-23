import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  const MePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 30.0),
      child: Center(
        child: Column(children: [
          Text(
            "Amanda Solza",
            textAlign: TextAlign.center,
            style:
                TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(
                  "https://blog.unyleya.edu.br/wp-content/uploads/2017/12/saiba-como-a-educacao-ajuda-voce-a-ser-uma-pessoa-melhor.jpeg"),
            ),
          ),
          Text(
            "Vocês ainda não são amigos",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
          ),
        ]),
      ),
    );
  }
}
