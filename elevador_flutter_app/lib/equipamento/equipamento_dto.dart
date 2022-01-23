// To parse this JSON data, do
//
//     final equipamentoDto = equipamentoDtoFromJson(jsonString);

import 'dart:convert';

List<EquipamentoDto> equipamentoDtoFromJson(String str) => List<EquipamentoDto>.from(json.decode(str).map((x) => EquipamentoDto.fromJson(x)));

String equipamentoDtoToJson(EquipamentoDto data) => json.encode(data.toJson());

class EquipamentoDto {
    final bool ativo;
    final String descricao;
    final String fabricante;
    final int id;
    final Tipo tipo;

    EquipamentoDto({
        this.ativo,
        this.descricao,
        this.fabricante,
        this.id,
        this.tipo,
    });

    factory EquipamentoDto.fromJson(Map<String, dynamic> json) => EquipamentoDto(
        ativo: json["ativo"] == null ? null : json["ativo"],
        descricao: json["descricao"] == null ? null : json["descricao"],
        fabricante: json["fabricante"] == null ? null : json["fabricante"],
        id: json["id"] == null ? null : json["id"],
        tipo: json["tipo"] == null ? null : Tipo.fromJson(json["tipo"]),
    );

    Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "descricao": descricao == null ? null : descricao,
        "fabricante": fabricante == null ? null : fabricante,
        "id": id == null ? null : id,
        "tipo": tipo == null ? null : tipo.toJson(),
    };
}

class Tipo {
    final String descricao;
    final int id;

    Tipo({
        this.descricao,
        this.id,
    });

    factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
        descricao: json["descricao"] == null ? null : json["descricao"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "id": id == null ? null : id,
    };
}
