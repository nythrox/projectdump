import 'package:trekkers/screens/user-participated-events/models/event_user_participated.dart';
import 'package:trekkers/screens/user-participated-events/repositories/user_events_repository.dart';

class UserParticipatedEventsScreenBloc {
  final UserEventsRepository _userEventsRepository;
  Future<List<EventUserParticipated>> eventUserParticipated;


  UserParticipatedEventsScreenBloc(int id, this._userEventsRepository){
    eventUserParticipated = _userEventsRepository.getEventsUserParticipated(id);
  }
}