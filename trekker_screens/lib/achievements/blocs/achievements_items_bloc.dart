import 'package:trekkers/achievements/models/medal_details.dart';
import 'package:trekkers/achievements/repositories/medal_repository.dart';

class AchievementsItemsBloc {

  final MedalRepository _medalRepository;

  Future<MedalDetails> details;

  AchievementsItemsBloc(userId, medalId, this._medalRepository){
    details = _medalRepository.getMedalById(userId, medalId);
  }

}