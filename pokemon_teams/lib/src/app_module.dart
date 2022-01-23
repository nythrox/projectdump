import 'package:pokemon_teams/src/pages/pokemons/pokemons_bloc.dart';
import 'package:pokemon_teams/src/shared/components/team-widget/TeamWidget_bloc.dart';
import 'package:pokemon_teams/src/shared/components/custom-icon-widget/CustomIconWidget_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_teams/src/app_widget.dart';
import 'package:pokemon_teams/src/app_bloc.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PokemonsBloc()),
        Bloc((i) => TeamWidgetBloc()),
        Bloc((i) => CustomIconWidgetBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
