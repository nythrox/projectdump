import 'package:rxdart/rxdart.dart';
import 'package:trekkers/trail/models/start_trail_dto.dart';
import 'package:trekkers/trail/repositories/trail_repository.dart';

class TrailMapBloc {
  final TrailRepository _trailRepository;

  final _loading$ = BehaviorSubject<bool>();
  Observable<bool> get loading => _loading$;

  final _result$ = BehaviorSubject<dynamic>();
  Observable get result => _result$;

  TrailMapBloc(this._trailRepository);

  Future<void> startTrail (StartTrailDto startTrailDto) async {
    try {
      _loading$.add(true);
      _result$.add(await _trailRepository.startTrail(startTrailDto));
    }
    catch (e) {
      _result$.addError(e);
    }
    finally {
      _loading$.add(false);
    }
  }

  void dispose(){
    _loading$.close();
    _result$.close();
  }
  
}