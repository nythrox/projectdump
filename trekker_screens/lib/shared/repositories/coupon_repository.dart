import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/models/coupon.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

abstract class ICouponRepository {
  Future<String> applyCoupon(CouponDto coupon);
}

class CouponRepository implements ICouponRepository {
  final CustomDio _customDio;

  CouponRepository(this._customDio);

  @override
  Future<String> applyCoupon(CouponDto coupon) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post(
        "${dio.options.baseUrl}coupons",
      );
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
}
