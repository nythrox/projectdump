import 'package:trekkers/events/blocs/ievent_bloc.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/repositories/event_category_repository.dart';
import 'package:trekkers/events/repositories/event_repository.dart';
import 'package:trekkers/shared/models/category.dart';

class EventBloc implements IEventBloc {
  final IEventRepository _eventRepository;
  final ICategoryRepository _categoryRepository;

  @override
  Future<List<Category>> eventCategories;

  EventBloc(this._eventRepository, this._categoryRepository) {
    eventCategories = _categoryRepository.findAll().then((e) => e.categories);
  }
  
  @override
  Future<List<Event>> findEventsByCategory(int id) async {
    try {
      print(id);
      return _eventRepository.findByCategory(id).then((e) => e.events);
    } catch (e) {
      rethrow;
    }
  }
}
