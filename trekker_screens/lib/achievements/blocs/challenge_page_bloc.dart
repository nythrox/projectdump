import 'package:trekkers/achievements/models/medal_details.dart';
import 'package:trekkers/achievements/repositories/medal_repository.dart';
import 'package:trekkers/achievements/repositories/tile_repository.dart';

class ChallengePageBloc {

  final TileRepository _tileRepository;

  Future<dynamic> tileDetails;

  ChallengePageBloc(userId, tileId, this._tileRepository ){
    tileDetails = _tileRepository.getTileById(userId, tileId);
  }

}