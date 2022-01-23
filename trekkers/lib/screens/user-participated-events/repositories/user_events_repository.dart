import 'package:dio/dio.dart';
import 'package:trekkers/events/components/event_detail.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/screens/user-participated-events/models/event_user_participated.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class UserEventsRepository {
  final CustomDio _customDio;

  UserEventsRepository(this._customDio);


  Future<List<EventUserParticipated>> getEventsUserParticipated(int id) async {
    final url = "events-user/" + id.toString();
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + url,
      );
      List<EventUserParticipated> events = eventUserParticipatedFromJson(response.data["events"]);
      return events;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}