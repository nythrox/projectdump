import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trekkers/trail/models/trail_log_dto.dart';
import 'package:trekkers/trail/repositories/trail_repository.dart';

class BeginTrailMapBloc {
  final TrailRepository _trailRepository;
  final _trailLog$ = BehaviorSubject<TrailLogDto>();
  get addTrailLog => _trailLog$.add;

  BeginTrailMapBloc(this._trailRepository) {
    _trailLog$.listen((trailLog) => _trailRepository.saveTrailLog(trailLog));
  }

  void dispose() {
    _trailLog$.close();
  }
}
