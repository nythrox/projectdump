// To parse this JSON data, do
//
//     final acaoRealizadaModel = acaoRealizadaModelFromJson(jsonString);

import 'dart:convert';

List<AcaoRealizadaModel> acaoRealizadaModelFromJson(String str) => List<AcaoRealizadaModel>.from(json.decode(str).map((x) => AcaoRealizadaModel.fromJson(x)));

String acaoRealizadaModelToJson(List<AcaoRealizadaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AcaoRealizadaModel {
    final String descricao;
    final int id;

    AcaoRealizadaModel({
        this.descricao,
        this.id,
    });

    factory AcaoRealizadaModel.fromJson(Map<String, dynamic> json) => AcaoRealizadaModel(
        descricao: json["descricao"] == null ? null : json["descricao"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "id": id == null ? null : id,
    };
}
