import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/shared/components/custom-icon-widget/CustomIconWidget_widget.dart';
import 'package:pokemon_teams/src/shared/styles/AppStyle.dart';

class TeamWidget extends StatelessWidget {
  final String name;

  const TeamWidget({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 10,right:10, bottom: 0,top:10),
          margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text(
                  name.toUpperCase(),
                  style: TextStyle(fontSize: 13, color: AppStyle.gray900),
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),Expanded(
                    child: Image.network(
                      "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PokemonElementLabel extends StatelessWidget {
  const PokemonElementLabel({
    Key key,
    @required this.element,
    @required this.color,
  }) : super(key: key);

  final String element;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          element,
          style: TextStyle(fontSize: 12, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
