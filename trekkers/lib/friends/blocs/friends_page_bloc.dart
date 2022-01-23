import 'package:trekkers/shared/repositories/progress_repository.dart';

class FriendsPageBloc {
  final ProgressRepository _progressRepository;

  Future<dynamic> progress; 

  FriendsPageBloc(int id, this._progressRepository){
    progress = _progressRepository.getUserProgress(id);
  }

}