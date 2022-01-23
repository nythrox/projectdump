import 'dart:convert';

import 'package:trekkers/shared/exceptions/authencation_exception.dart';
import 'package:trekkers/shared/utils/custom_dio.dart';
import 'package:dio/dio.dart';

class AddressRepository {
  final CustomDio _customDio;

  AddressRepository(this._customDio);

  @override
  Future<AddressDto> findByCep(String cep) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post("${dio.options.baseUrl}adresses",
          data: jsonEncode(CreateAddressDto));
      return response.data;
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> save(CreateAddressDto createAddressDto) async {
    final dio = _customDio.dio;
    try {
      final response = await dio.post("${dio.options.baseUrl}adresses",
          data: jsonEncode(createAddressDto));
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
}

class CreateAddressDto {
  String place;
  String number;
  String district;
  int city;
  int province;
  String zipCode;
  String references;
  int status;
  int user;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['place'] = this.place;
    data['number'] = this.number;
    data['district'] = this.district;
    data['city'] = this.city;
    data['province'] = this.province;
    data['zip_code'] = this.zipCode;
    data['references'] = this.references;
    data['status'] = this.status;
    data['user'] = this.user;
    return data;
  }
}

class AddressDto {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String unidade;
  String ibge;
  String gia;

  AddressDto(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.unidade,
      this.ibge,
      this.gia});

  AddressDto.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    unidade = json['unidade'];
    ibge = json['ibge'];
    gia = json['gia'];
  }
}
