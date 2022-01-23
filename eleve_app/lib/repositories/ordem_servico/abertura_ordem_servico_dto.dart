// To parse this JSON data, do
//
//     final aberturaOrdemServicoDto = aberturaOrdemServicoDtoFromJson(jsonString);

import 'dart:convert';

AberturaOrdemServicoDto aberturaOrdemServicoDtoFromJson(String str) => AberturaOrdemServicoDto.fromJson(json.decode(str));

String aberturaOrdemServicoDtoToJson(AberturaOrdemServicoDto data) => json.encode(data.toJson());

class AberturaOrdemServicoDto {
    final int clienteEmpresaId;
    final String contato;
    final String dataContatoCliente;
    final int empresaManutencaoId;
    final int usuarioClienteId;

    AberturaOrdemServicoDto({
        this.clienteEmpresaId,
        this.contato,
        this.dataContatoCliente,
        this.empresaManutencaoId,
        this.usuarioClienteId,
    });

    factory AberturaOrdemServicoDto.fromJson(Map<String, dynamic> json) => AberturaOrdemServicoDto(
        clienteEmpresaId: json["clienteEmpresaId"] == null ? null : json["clienteEmpresaId"],
        contato: json["contato"] == null ? null : json["contato"],
        dataContatoCliente: json["dataContatoCliente"] == null ? null : json["dataContatoCliente"],
        empresaManutencaoId: json["empresaManutencaoId"] == null ? null : json["empresaManutencaoId"],
        usuarioClienteId: json["usuarioClienteId"] == null ? null : json["usuarioClienteId"],
    );

    Map<String, dynamic> toJson() => {
        "clienteEmpresaId": clienteEmpresaId == null ? null : clienteEmpresaId,
        "contato": contato == null ? null : contato,
        "dataContatoCliente": dataContatoCliente == null ? null : dataContatoCliente,
        "empresaManutencaoId": empresaManutencaoId == null ? null : empresaManutencaoId,
        "usuarioClienteId": usuarioClienteId == null ? null : usuarioClienteId,
    };
}
