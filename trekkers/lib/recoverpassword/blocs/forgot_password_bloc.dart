import 'package:rxdart/rxdart.dart';
import 'package:trekkers/recoverpassword/repositories/forgot_password_repository.dart';

class ForgotPasswordBloc {
  final ForgotPasswordRepository _forgotPasswordRepository;

  final _loading$ = BehaviorSubject<bool>();
  Observable get loading => _loading$;
  final _email$ = BehaviorSubject<String>();
  final _response$ = BehaviorSubject();
  Observable get response => _response$;

  // get emailInput => _email$.sink.add;

  ForgotPasswordBloc(this._forgotPasswordRepository);

  resetPassword(String email) async {
    _loading$.add(true);
    try {
      final response = await _forgotPasswordRepository.resetPassword(email);

      _response$.add(response.data);
    } catch (e) {
      _response$.addError(e);
    } finally {
      _loading$.add(false);
    }
  }

  void dipose() {
    _email$.close();
  }
}
