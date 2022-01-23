import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/shared/components/pokemon-in-team-card/pokemon-in-team-card_widget.dart';

class PokemonsPage extends StatefulWidget {
  @override
  _PokemonsPageState createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return PokemonInTeamCardWidget(
              name: "Bulbasaur",
              elements: ["Fire", "Water"],
            );
          },
        )
      ],
    );
  }
}
