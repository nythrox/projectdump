import 'package:trekkers/shared/repositories/progress_repository.dart';
import 'package:trekkers/store/model/progress.dart';
import 'package:trekkers/store/repositories/game_repository.dart';

class FriendsPageBloc {
  final GameRepository _gameRepository;

  Future<Progress> progress; 

  FriendsPageBloc(int id, this._gameRepository){
    progress = _gameRepository.findProgressByUserId(id);
  }

}