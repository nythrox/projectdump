import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trekkers/payment/blocs/payment_form_bloc.dart';
import 'package:trekkers/payment/models/payment_form_dto.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';

class PaymentRepository {
  final CustomDio _customDio;
  final String _baseUrl = "/coupons";
  PaymentRepository(this._customDio);

  Future<dynamic> buyTicket(PaymentFormDto payment) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post("${dio.options.baseUrl}" + _baseUrl,
          data: jsonEncode(payment));
      return response.data;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
