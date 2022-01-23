import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trekkers/checkin/repositories/qrcode_repository.dart';

class CheckInBloc {
  final QrCodeRepository _qrCodeRepository;

  final _loading$ = BehaviorSubject<bool>();
  Observable<bool> get loading => _loading$;

  final _result$ = BehaviorSubject();
  Observable get result => _result$;

  CheckInBloc(this._qrCodeRepository);

  void scanQrCode(int userId, int eventId) async {
    _loading$.add(true);
    try {
      _result$.add(await _qrCodeRepository.scanQrCode(userId, eventId));
    } catch (e) {
      _result$.addError(e);
    } finally {
      _loading$.add(null);
    }
  }

  void dispose() {
    _loading$.close();
    _result$.close();
  }
}
