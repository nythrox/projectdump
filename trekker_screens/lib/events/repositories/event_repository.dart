import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:trekkers/events/components/event_detail.dart';
import 'package:trekkers/events/models/event.dart';
import 'package:trekkers/events/models/waiting_list_dto.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

abstract class IEventRepository {
  Future<EventResponse> findByCategory(int category);
  Future<String> waitingList(WaitingListDto dto);
  Future<EventDetail> getEvent(int id);
}

class EventRepository extends BlocBase implements IEventRepository {
  final CustomDio _customDio;

  EventRepository(this._customDio);

  @override
  Future<EventResponse> findByCategory(int category) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}events/category/$category",
      );

      return EventResponse.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> waitingList(WaitingListDto dto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}waitinglists",
      );
      return response.data["success"];
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EventDetail> getEvent(int id) async {
    final url = "events/" + id.toString();
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl}" + url,
      );
      return EventDetail.fromJson(response.data);
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  
}
