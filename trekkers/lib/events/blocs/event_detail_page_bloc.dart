import 'package:rxdart/rxdart.dart';
import 'package:trekkers/events/components/event_detail.dart';
import 'package:trekkers/events/models/waiting_list_dto.dart';
import 'package:trekkers/events/repositories/event_repository.dart';

class EventDetailPageBloc {
  final IEventRepository _eventRepository;

  final _waitingListLoading$ = BehaviorSubject<bool>();
  Observable<bool> get waitingListLoading => _waitingListLoading$;

  Future<EventDetail> eventDetails;

  final _response$ = BehaviorSubject();
  Observable get response => _response$;

  EventDetailPageBloc(int id, this._eventRepository) {
    eventDetails = _eventRepository.getEvent(id);
  }

  void waitingList(WaitingListDto dto) async {
    try {
      _waitingListLoading$.add(true);
      var res = await _eventRepository.waitingList(dto);
      _response$.add(res);
    } catch (e) {
      _response$.addError(e);
    } finally {
      _waitingListLoading$.add(false);
    }
  }

  void dispose (){
    _waitingListLoading$.close();
    _response$.close();
  }

}
