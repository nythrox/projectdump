import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:trekkers/shared/models/iuser.dart';
import 'package:trekkers/shared/utils/store.dart';
import 'package:rxdart/rxdart.dart';

abstract class IAuthenticationBloc implements Disposable {
  ValueObservable<User> get user;
  void signOut();
  void userEvent(User user);
}

class AuthenticationBloc extends BlocBase implements IAuthenticationBloc {
 final Store<String> _store;

  final _user$ = BehaviorSubject<User>();
  final _signOut = PublishSubject<User>();

  AuthenticationBloc(this._store) {
    user = _user$.mergeWith([
      _signOut.asyncMap((e) => _store.delete("token")).mapTo(null)
    ]).publishValue()
      ..connect();
  }

  @override
  ValueObservable<User> user;

  @override
  void signOut() => _user$.add(null);

  @override
  void userEvent(User user) => _user$.add(user);

  @override
  void dispose() {
    super.dispose();
    _signOut.close();
    _user$.close();
  }
}
