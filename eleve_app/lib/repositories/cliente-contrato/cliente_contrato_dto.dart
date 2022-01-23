// To parse this JSON data, do
//
//     final clienteContratoDto = clienteContratoDtoFromJson(jsonString);

import 'dart:convert';

ClienteContratoDto clienteContratoDtoFromJson(String str) => ClienteContratoDto.fromJson(json.decode(str));

String clienteContratoDtoToJson(ClienteContratoDto data) => json.encode(data.toJson());

class ClienteContratoDto {
    final int clienteId;
    final int empresaMantenedoraId;
    final List<int> equipamentosClienteIds;
    final DateTime fim;
    final int id;
    final DateTime inicio;
    final String tipo;
    final int valorMensal;

    ClienteContratoDto({
        this.clienteId,
        this.empresaMantenedoraId,
        this.equipamentosClienteIds,
        this.fim,
        this.id,
        this.inicio,
        this.tipo,
        this.valorMensal,
    });

    factory ClienteContratoDto.fromJson(Map<String, dynamic> json) => ClienteContratoDto(
        clienteId: json["clienteId"] == null ? null : json["clienteId"],
        empresaMantenedoraId: json["empresaMantenedoraId"] == null ? null : json["empresaMantenedoraId"],
        equipamentosClienteIds: json["equipamentosClienteIds"] == null ? null : List<int>.from(json["equipamentosClienteIds"].map((x) => x)),
        fim: json["fim"] == null ? null : DateTime.parse(json["fim"]),
        id: json["id"] == null ? null : json["id"],
        inicio: json["inicio"] == null ? null : DateTime.parse(json["inicio"]),
        tipo: json["tipo"] == null ? null : json["tipo"],
        valorMensal: json["valorMensal"] == null ? null : json["valorMensal"],
    );

    Map<String, dynamic> toJson() => {
        "clienteId": clienteId == null ? null : clienteId,
        "empresaMantenedoraId": empresaMantenedoraId == null ? null : empresaMantenedoraId,
        "equipamentosClienteIds": equipamentosClienteIds == null ? null : List<dynamic>.from(equipamentosClienteIds.map((x) => x)),
        "fim": fim == null ? null : fim.toIso8601String(),
        "id": id == null ? null : id,
        "inicio": inicio == null ? null : inicio.toIso8601String(),
        "tipo": tipo == null ? null : tipo,
        "valorMensal": valorMensal == null ? null : valorMensal,
    };
}
