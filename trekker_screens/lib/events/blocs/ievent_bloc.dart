import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/shared/models/category.dart';

abstract class IEventBloc {
  Future<List<Event>> findEventsByCategory(int categoryId);
  Future<List<Category>> eventCategories;
}
