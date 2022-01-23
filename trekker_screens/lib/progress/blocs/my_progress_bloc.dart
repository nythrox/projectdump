import 'package:trekkers/progress/blocs/iprogress_bloc.dart';
import 'package:trekkers/store/model/progress.dart';
import 'package:trekkers/store/repositories/game_repository.dart';

abstract class IMyProgressBloc {
  Future<Progress> get progress;
}

class MyProgressBloc implements IMyProgressBloc {
  final IGameRepository _gameRepository;

  MyProgressBloc(this._gameRepository) {
    progress = _gameRepository.findProgressByUserId(1);
  }

  @override
  Future<Progress> progress;
}
