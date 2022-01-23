// To parse this JSON data, do
//
//     final criarOsPreventivaDto = criarOsPreventivaDtoFromJson(jsonString);

import 'dart:convert';

CriarOsPreventivaDto criarOsPreventivaDtoFromJson(String str) => CriarOsPreventivaDto.fromJson(json.decode(str));

String criarOsPreventivaDtoToJson(CriarOsPreventivaDto data) => json.encode(data.toJson());

class CriarOsPreventivaDto {
    final int clienteEmpresaId;
    final String contato;
    final String dataContatoCliente;
    final int empresaManutencaoId;
    final List<int> equipamentoClientesId;
    final int usuarioClienteId;

    CriarOsPreventivaDto({
        this.clienteEmpresaId,
        this.contato,
        this.dataContatoCliente,
        this.empresaManutencaoId,
        this.equipamentoClientesId,
        this.usuarioClienteId,
    });

    factory CriarOsPreventivaDto.fromJson(Map<String, dynamic> json) => CriarOsPreventivaDto(
        clienteEmpresaId: json["clienteEmpresaId"] == null ? null : json["clienteEmpresaId"],
        contato: json["contato"] == null ? null : json["contato"],
        dataContatoCliente: json["dataContatoCliente"] == null ? null : json["dataContatoCliente"],
        empresaManutencaoId: json["empresaManutencaoId"] == null ? null : json["empresaManutencaoId"],
        equipamentoClientesId: json["equipamentoClientesId"] == null ? null : List<int>.from(json["equipamentoClientesId"].map((x) => x)),
        usuarioClienteId: json["usuarioClienteId"] == null ? null : json["usuarioClienteId"],
    );

    Map<String, dynamic> toJson() => {
        "clienteEmpresaId": clienteEmpresaId == null ? null : clienteEmpresaId,
        "contato": contato == null ? null : contato,
        "dataContatoCliente": dataContatoCliente == null ? null : dataContatoCliente,
        "empresaManutencaoId": empresaManutencaoId == null ? null : empresaManutencaoId,
        "equipamentoClientesId": equipamentoClientesId == null ? null : List<dynamic>.from(equipamentoClientesId.map((x) => x)),
        "usuarioClienteId": usuarioClienteId == null ? null : usuarioClienteId,
    };
}
