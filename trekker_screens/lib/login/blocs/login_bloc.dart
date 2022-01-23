
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:trekkers/login/models/login_dto.dart';
import 'package:trekkers/shared/models/admin.dart';
import 'package:trekkers/shared/models/customer.dart';
import 'package:trekkers/shared/models/iuser.dart';
import 'package:trekkers/shared/repositories/user_repository.dart';
import 'package:trekkers/shared/utils/store.dart';
import 'package:rxdart/rxdart.dart';


abstract class ILoginBloc {
  void emailEvent(String email);
  void passwordEvent(String password);
  Observable<bool> get loading;
  Observable<User> get currentUser;
}

class LoginBloc extends BlocBase implements ILoginBloc {
  final Store<String> _store;
  final IUserRepository _userRepository;
  final _email$ = PublishSubject<String>();
  final _password$ = PublishSubject<String>();
  final _dispose$ = PublishSubject();
  Observable<bool> _loading;
  Observable<User> _currentUser;

  LoginBloc(this._userRepository, this._store) {
    final request = Observable.zip2(
            _email$,
            _password$,
            (String email, String password) =>
                LoginDto(email: email, password: password))
        .switchMap((e) => Observable.fromFuture(_userRepository.login(e))
            .asyncMap((e) => _store.save("token", e.token.accessToken))
            .asyncMap((e) => _userRepository.findCurrentUser())
            .map((e) => e.userDto.role == "admin"
                ? Admin(e.userDto.id, e.userDto.email, e.userDto.name,
                    e.userDto.avatar)
                : Customer(e.userDto.id, e.userDto.email, e.userDto.name,
                    e.userDto.avatar))
            .startWith(null))
        .asBroadcastStream();

    _loading =
        request.map((e) => e == null).startWith(false);

    _currentUser = request.where((e) => e != null).takeUntil(_dispose$);
  }

  @override
  void emailEvent(String email) => _email$.add(email);

  @override
  Observable<bool> get loading => _loading;

  @override
  Observable<User> get currentUser => _currentUser;

  @override
  void passwordEvent(String password) => _password$.add(password);

  @override
  void dispose() {
    super.dispose();
    _email$.close();
    _password$.close();
    _dispose$.close();
  }
}

String validateEmail(String email) {
  if (email.isEmpty)
    return "Digite seu email";
  else if (!email.contains('@') && !email.contains('.'))
    return "Digite um email válido";
  else
    return null;
}

String validatePassword(String password) {
  if (password.isEmpty)
    return "Digite sua senha";
  else if (password.length < 6 || password.length > 20)
    return "Digite uma senha entre 6 e 20 caracteres";
  else
    return null;
}
