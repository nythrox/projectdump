
import 'package:rxdart/rxdart.dart';
import 'package:trekkers/shared/repositories/user_repository.dart';

abstract class ISignUpBloc {
  Observable get response;
  Observable<bool> get loading;

  void nameEvent(String name);
  void phoneEvent(String phone);
  void emailEvent(String email);
  void passwordEvent(String password);
}

class SignUpBloc implements ISignUpBloc {
  final IUserRepository _userRepository;
  final _name$ = PublishSubject();
  final _phone$ = PublishSubject();
  final _email$ = PublishSubject();
  final _password$ = PublishSubject();
  Observable _response;
  Observable<bool> _loading;

  SignUpBloc(this._userRepository) {
    _response = Observable.zip4(
      _name$,
      _email$,
      _phone$,
      _password$,
      (name, email, phone, password) => SignUpDto(
        email: email,
        name: name,
        password: password,
       // phone: phone,
      ),
    )
        .switchMap(
          (e) => Observable.fromFuture(
            _userRepository.signUp(e),
          ).startWith(null),
        )
        .asBroadcastStream();

    _loading = _response.map((e) => e == null).startWith(false);
  }

  Observable get response => _response;
  Observable<bool> get loading => _loading;

  @override
  void emailEvent(String email) => _email$.add(email);

  @override
  void nameEvent(String name) => _name$.add(name);

  @override
  void passwordEvent(String password) => _password$.add(password);

  @override
  void phoneEvent(String phone) => _phone$.add(phone);

  void dispose() {
    _name$.close();
    _phone$.close();
    _email$.close();
    _password$.close();
  }
}