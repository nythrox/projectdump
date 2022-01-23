import 'package:trekkers/achievements/models/medal.dart';
import 'package:trekkers/achievements/repositories/medal_repository.dart';
import 'package:trekkers/achievements/repositories/tile_repository.dart';

class AchievementsProgressBloc {
  final MedalRepository _medalRepository;
  final TileRepository _tileRepository;

  Future<List<Medal>> medals;
  //TODO:
  Future<List<dynamic>> tiles;

  AchievementsProgressBloc(int id, this._medalRepository, this._tileRepository){
    medals = _medalRepository.getMedalsFromUserId(id);
    tiles = _tileRepository.getTilesFromUserId(id);
  }

}