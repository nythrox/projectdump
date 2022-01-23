import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/shared/components/custom-icon-widget/CustomIconWidget_widget.dart';
import 'package:pokemon_teams/src/shared/styles/AppStyle.dart';

class PokemonInTeamCardWidget extends StatelessWidget {
  final String name;
  final List<String> elements;
  final List<Widget> actions;

  const PokemonInTeamCardWidget(
      {Key key, @required this.elements, @required this.name, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
              Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 16, color: AppStyle.gray900),
              ),
              SizedBox(
                height: 5,
              ),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, i) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemCount: elements.length,
                itemBuilder: (context, i) {
                  return PokemonElementLabel(
                    element: elements[i],
                    color:
                        elements[i] == "Grass" ? Colors.green : Colors.purple,
                  );
                },
              ),
            ],
          ),
        ),
        Positioned(
          right: 30,
          top: -50,
          child: Image.network(
            "https://img.pokemondb.net/sprites/x-y/normal/bulbasaur.png",
            fit: BoxFit.fitHeight,
            height: 230,
          ),
        ),
        if (actions != null)
          Positioned(
            right: 10,
            top: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions ?? null,
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
