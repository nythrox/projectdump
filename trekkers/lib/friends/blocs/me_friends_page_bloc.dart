import 'package:rxdart/rxdart.dart';
import 'package:trekkers/friends/models/friend.dart';
import 'package:trekkers/friends/repositories/friends_repository.dart';

class MeFriendsPageBloc {
  final FriendsRepository _friendsRepository;
  Future<List<Friend>> friends;

  MeFriendsPageBloc(this._friendsRepository){
    friends = _friendsRepository.getFriends();
  }


}
