import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/shared/components/custom-icon-widget/CustomIconWidget_widget.dart';
import 'package:pokemon_teams/src/shared/components/pokemon-in-team-card/pokemon-in-team-card_widget.dart';
import 'package:pokemon_teams/src/shared/styles/AppStyle.dart';

class EditTeamPage extends StatefulWidget {
  @override
  _EditTeamPageState createState() => _EditTeamPageState();
}

class _EditTeamPageState extends State<EditTeamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primaryColor,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
              size: AppStyle.appBarIconSize,
              color: AppStyle.gray900,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: AppStyle.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: AppStyle.appBarIconSize,
            color: AppStyle.gray900,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "EditTeam",
          style: TextStyle(color: AppStyle.gray900),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Team",
                  style: TextStyle(fontSize: 25),
                ),
                CustomIconWidget(
                  icon: Icons.edit,
                  onPressed: () {},
                )
              ]),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            padding: EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, i) {
              return PokemonInTeamCardWidget(
                name: "Bulbasaur",
                elements: ["Grass", "Poison"],
                actions: <Widget>[
                  CustomIconWidget(
                    icon: Icons.edit,
                    onPressed: () {},
                  ),
                  CustomIconWidget(
                    icon: Icons.delete,
                    onPressed: () {},
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
