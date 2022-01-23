import 'package:dio/dio.dart';
import 'package:trekkers/friends/models/friend.dart';
import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class FriendsRepository {
  final String baseUrl = "friends/";
  final CustomDio _customDio;

  FriendsRepository(this._customDio);

  Future<List<Friend>> getFriends() async {
    final String url = "my-add-friends";
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl + baseUrl + url}",
      );
      print(response.data);
      List<Friend> friends = response.data["friends"]
          .map((friend) => Friend.fromJson(friend))
          .toList();
      return friends;
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> addFriend(int id) async{
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl + baseUrl}",
        data: {
          "friend_id": id
        }
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  
  Future<dynamic> acceptFriend(int id) async{
    final String url = "accept/"+id.toString();
    final dio = _customDio.dio;
    try {
      final response = await dio.get(
        "${dio.options.baseUrl + baseUrl + url}",
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null && e.response.statusCode == 401) {
        throw AuthenticationException(e.response.data["error"]);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  
  // Future<Friend> getFriend(int id) async{
  //   final dio = _customDio.dio;
  //   try {
  //     final response = await dio.get(
  //       "${dio.options.baseUrl + baseUrl + id.toString()}",
  //     );
  //     print(response.data);
  //     return Friend.fromJson(response.data);
  //   } on DioError catch (e) {
  //     if (e.response != null && e.response.statusCode == 401) {
  //       throw AuthenticationException(e.response.data["error"]);
  //     }
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  
  // Future<dynamic> deleteFriend(int id) async{
  //   final dio = _customDio.dio;
  //   try {
  //     final response = await dio.delete(
  //       "${dio.options.baseUrl + baseUrl + id.toString()}",
  //     );
  //     print(response.data);
  //     return response.data;
  //   } on DioError catch (e) {
  //     if (e.response != null && e.response.statusCode == 401) {
  //       throw AuthenticationException(e.response.data["error"]);
  //     }
  //     rethrow;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  
}
