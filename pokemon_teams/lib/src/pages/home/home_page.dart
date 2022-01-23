import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/pages/edit_team/edit_team_page.dart';
import 'package:pokemon_teams/src/pages/pokemons/pokemons_page.dart';
import 'package:pokemon_teams/src/shared/components/team-widget/TeamWidget_widget.dart';
import 'package:pokemon_teams/src/shared/styles/AppStyle.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: AppStyle.background,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppStyle.primaryColor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditTeamPage()));
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            backgroundColor: AppStyle.background,
            title: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.account_balance_wallet,
                  color: AppStyle.gray900,
                  size: AppStyle.appBarIconSize,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Poketit",
                  style: TextStyle(color: AppStyle.gray900),
                )
              ],
            ),
            elevation: 0,
            actions: <Widget>[
              Icon(
                Icons.menu,
                color: AppStyle.gray900,
                size: AppStyle.appBarIconSize,
              ),
              SizedBox(
                width: 20,
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: AppStyle.gray700,
              labelColor: AppStyle.gray900,
              indicatorColor: AppStyle.primaryColor,
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Tab(
                    child: Text("My Teams"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Tab(
                    child: Text("Favorites"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Tab(
                    child: Text("Chat"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Tab(
                    child: Text("Pokemons"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "You haven't created any teams yet.",
                      style: TextStyle(fontSize: 30, color: AppStyle.gray900),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      color: AppStyle.primaryColor,
                      elevation: 5,
                      child: Text("Create Team"),
                      textColor: AppStyle.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditTeamPage()));
                      },
                    ),
                    TeamWidget(name: "Green Team",)
                  ],
                ),
              ),
              ListView(),
              ListView(),
              PokemonsPage(),
            ],
          )),
    );
  }
}
