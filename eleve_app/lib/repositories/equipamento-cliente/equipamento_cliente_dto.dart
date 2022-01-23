// To parse this JSON data, do
//
//     final equipamentoClienteDto = equipamentoClienteDtoFromJson(jsonString);

import 'dart:convert';

EquipamentoClienteDto equipamentoClienteDtoFromJson(String str) => EquipamentoClienteDto.fromJson(json.decode(str));

String equipamentoClienteDtoToJson(EquipamentoClienteDto data) => json.encode(data.toJson());

class EquipamentoClienteDto {
    final int capaciddadePassageiros;
    final int cargaMaxima;
    final bool casaDeMaquina;
    final int clienteId;
    final int diametroCaboDeAco;
    final Equipamento equipamento;
    final int id;
    final int quantidadeParadas;
    final int serialPlacaCentral;
    final Tipo tipo;
    final String torre;
    final int velocidade;

    EquipamentoClienteDto({
        this.capaciddadePassageiros,
        this.cargaMaxima,
        this.casaDeMaquina,
        this.clienteId,
        this.diametroCaboDeAco,
        this.equipamento,
        this.id,
        this.quantidadeParadas,
        this.serialPlacaCentral,
        this.tipo,
        this.torre,
        this.velocidade,
    });

    factory EquipamentoClienteDto.fromJson(Map<String, dynamic> json) => EquipamentoClienteDto(
        capaciddadePassageiros: json["capaciddadePassageiros"] == null ? null : json["capaciddadePassageiros"],
        cargaMaxima: json["cargaMaxima"] == null ? null : json["cargaMaxima"],
        casaDeMaquina: json["casaDeMaquina"] == null ? null : json["casaDeMaquina"],
        clienteId: json["clienteId"] == null ? null : json["clienteId"],
        diametroCaboDeAco: json["diametroCaboDeAco"] == null ? null : json["diametroCaboDeAco"],
        equipamento: json["equipamento"] == null ? null : Equipamento.fromJson(json["equipamento"]),
        id: json["id"] == null ? null : json["id"],
        quantidadeParadas: json["quantidadeParadas"] == null ? null : json["quantidadeParadas"],
        serialPlacaCentral: json["serialPlacaCentral"] == null ? null : json["serialPlacaCentral"],
        tipo: json["tipo"] == null ? null : Tipo.fromJson(json["tipo"]),
        torre: json["torre"] == null ? null : json["torre"],
        velocidade: json["velocidade"] == null ? null : json["velocidade"],
    );

    Map<String, dynamic> toJson() => {
        "capaciddadePassageiros": capaciddadePassageiros == null ? null : capaciddadePassageiros,
        "cargaMaxima": cargaMaxima == null ? null : cargaMaxima,
        "casaDeMaquina": casaDeMaquina == null ? null : casaDeMaquina,
        "clienteId": clienteId == null ? null : clienteId,
        "diametroCaboDeAco": diametroCaboDeAco == null ? null : diametroCaboDeAco,
        "equipamento": equipamento == null ? null : equipamento.toJson(),
        "id": id == null ? null : id,
        "quantidadeParadas": quantidadeParadas == null ? null : quantidadeParadas,
        "serialPlacaCentral": serialPlacaCentral == null ? null : serialPlacaCentral,
        "tipo": tipo == null ? null : tipo.toJson(),
        "torre": torre == null ? null : torre,
        "velocidade": velocidade == null ? null : velocidade,
    };
}

class Equipamento {
    final bool ativo;
    final String descricao;
    final String fabricante;
    final int id;
    final Tipo tipo;

    Equipamento({
        this.ativo,
        this.descricao,
        this.fabricante,
        this.id,
        this.tipo,
    });

    factory Equipamento.fromJson(Map<String, dynamic> json) => Equipamento(
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
