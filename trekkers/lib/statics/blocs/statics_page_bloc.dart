import 'package:trekkers/statics/models/relatorio-trilha.dart';
import 'package:trekkers/statics/repositories/trails_repository.dart';

class StaticsPageBloc {
  final TrailsRepository _trailsRepository;

  Future<RelatorioTrilha> statistics;

  StaticsPageBloc(int id, this._trailsRepository){
    statistics = _trailsRepository.getTrailStatistics(id);
  }


}