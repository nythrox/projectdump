import 'package:dio/dio.dart';
import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class QrCodeRepository {
  final CustomDio _customDio;
  final String baseUrl = "/event-checkin";

  QrCodeRepository(this._customDio);

  Future<dynamic> scanQrCode(int userId, int eventId) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}" +
            baseUrl +
            userId.toString() +
            "-" +
            eventId.toString(),
      );
      return response.data;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
