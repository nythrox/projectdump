// To parse this JSON data, do
//
//     final clienteDto = clienteDtoFromJson(jsonString);

import 'dart:convert';

List<ClienteDto> clienteDtoFromJson(String str) => List<ClienteDto>.from(json.decode(str).map((x) => ClienteDto.fromJson(x)));

String clienteDtoToJson(List<ClienteDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClienteDto {
    final ClienteEndereco clienteEndereco;
    final String cnpj;
    final int id;
    final int inscricaoEstadual;
    final String nome;

    ClienteDto({
        this.clienteEndereco,
        this.cnpj,
        this.id,
        this.inscricaoEstadual,
        this.nome,
    });

    factory ClienteDto.fromJson(Map<String, dynamic> json) => ClienteDto(
        clienteEndereco: json["clienteEndereco"] == null ? null : ClienteEndereco.fromJson(json["clienteEndereco"]),
        cnpj: json["cnpj"] == null ? null : json["cnpj"],
        id: json["id"] == null ? null : json["id"],
        inscricaoEstadual: json["inscricaoEstadual"] == null ? null : json["inscricaoEstadual"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "clienteEndereco": clienteEndereco == null ? null : clienteEndereco.toJson(),
        "cnpj": cnpj == null ? null : cnpj,
        "id": id == null ? null : id,
        "inscricaoEstadual": inscricaoEstadual == null ? null : inscricaoEstadual,
        "nome": nome == null ? null : nome,
    };
}

class ClienteEndereco {
    ClienteEndereco();

    factory ClienteEndereco.fromJson(Map<String, dynamic> json) => ClienteEndereco(
    );

    Map<String, dynamic> toJson() => {
    };
}
