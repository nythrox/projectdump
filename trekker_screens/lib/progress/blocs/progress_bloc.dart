import 'package:trekkers/progress/blocs/iprogress_bloc.dart';
import 'package:trekkers/store/model/level.dart';
import 'package:trekkers/store/repositories/game_repository.dart';

class ProgressBloc implements IProgressBloc {
  final IGameRepository _gameRepository;

  @override
  Future<List<Level>> levels;

  ProgressBloc(this._gameRepository) {
    levels = _gameRepository.findGameLevels().then((e) => e.levels);
  }
}
