// To parse this JSON data, do
//
//     final ordemServicoModel = ordemServicoModelFromJson(jsonString);

import 'dart:convert';

List<OrdemServicoModel> ordemServicoModelFromJson(String str) =>
    List<OrdemServicoModel>.from(
        json.decode(str).map((x) => OrdemServicoModel.fromJson(x)));

String ordemServicoModelToJson(List<OrdemServicoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrdemServicoModel {
  final String antesEDepois;
  final ClienteEmpresa clienteEmpresa;
  final String contato;
  final DatasOsDto datasOsDto;
  final Empresa empresaManutencao;
  final int id;
  final String numero;
  final String statusOs;
  final TipoAtendimentoOs tipoAtendimentoOs;
  final String tipoOs;

  OrdemServicoModel({
    this.antesEDepois,
    this.clienteEmpresa,
    this.contato,
    this.datasOsDto,
    this.empresaManutencao,
    this.id,
    this.numero,
    this.statusOs,
    this.tipoAtendimentoOs,
    this.tipoOs,
  });

  factory OrdemServicoModel.fromJson(Map<String, dynamic> json) =>
      OrdemServicoModel(
        antesEDepois:
            json["antesEDepois"] == null ? null : json["antesEDepois"],
        clienteEmpresa: json["clienteEmpresa"] == null
            ? null
            : ClienteEmpresa.fromJson(json["clienteEmpresa"]),
        contato: json["contato"] == null ? null : json["contato"],
        datasOsDto: json["datasOSDto"] == null
            ? null
            : DatasOsDto.fromJson(json["datasOSDto"]),
        empresaManutencao: json["empresaManutencao"] == null
            ? null
            : Empresa.fromJson(json["empresaManutencao"]),
        id: json["id"] == null ? null : json["id"],
        numero: json["numero"] == null ? null : json["numero"],
        statusOs: json["statusOS"] == null ? null : json["statusOS"],
        tipoAtendimentoOs: json["tipoAtendimentoOS"] == null
            ? null
            : TipoAtendimentoOs.fromJson(json["tipoAtendimentoOS"]),
        tipoOs: json["tipoOS"] == null ? null : json["tipoOS"],
      );

  Map<String, dynamic> toJson() => {
        "antesEDepois": antesEDepois == null ? null : antesEDepois,
        "clienteEmpresa":
            clienteEmpresa == null ? null : clienteEmpresa.toJson(),
        "contato": contato == null ? null : contato,
        "datasOSDto": datasOsDto == null ? null : datasOsDto.toJson(),
        "empresaManutencao":
            empresaManutencao == null ? null : empresaManutencao.toJson(),
        "id": id == null ? null : id,
        "numero": numero == null ? null : numero,
        "statusOS": statusOs == null ? null : statusOs,
        "tipoAtendimentoOS":
            tipoAtendimentoOs == null ? null : tipoAtendimentoOs.toJson(),
        "tipoOS": tipoOs == null ? null : tipoOs,
      };
}

class ClienteEmpresa {
  final DateTime canceledAt;
  final Cliente cliente;
  final Empresa empresa;
  final int id;
  final int numero;
  final String numeroFormatado;
  final Usuario usuario;

  ClienteEmpresa({
    this.canceledAt,
    this.cliente,
    this.empresa,
    this.id,
    this.numero,
    this.numeroFormatado,
    this.usuario,
  });

  factory ClienteEmpresa.fromJson(Map<String, dynamic> json) => ClienteEmpresa(
        canceledAt: json["canceledAt"] == null
            ? null
            : DateTime.parse(json["canceledAt"]),
        cliente:
            json["cliente"] == null ? null : Cliente.fromJson(json["cliente"]),
        empresa:
            json["empresa"] == null ? null : Empresa.fromJson(json["empresa"]),
        id: json["id"] == null ? null : json["id"],
        numero: json["numero"] == null ? null : json["numero"],
        numeroFormatado:
            json["numeroFormatado"] == null ? null : json["numeroFormatado"],
        usuario:
            json["usuario"] == null ? null : Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "canceledAt": canceledAt == null ? null : canceledAt.toIso8601String(),
        "cliente": cliente == null ? null : cliente.toJson(),
        "empresa": empresa == null ? null : empresa.toJson(),
        "id": id == null ? null : id,
        "numero": numero == null ? null : numero,
        "numeroFormatado": numeroFormatado == null ? null : numeroFormatado,
        "usuario": usuario == null ? null : usuario.toJson(),
      };
}

class Cliente {
  final int id;
  final String nome;

  Cliente({
    this.id,
    this.nome,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
      };
}

class Empresa {
  final bool ativo;
  final DateTime canceledAt;
  final List<Cliente> clientes;
  final String createdBy;
  final DateTime createdDate;
  final int id;
  final String lastModifiedBy;
  final DateTime lastModifiedDate;
  final String nome;
  final int numero;
  final String numeroFormatado;

  Empresa({
    this.ativo,
    this.canceledAt,
    this.clientes,
    this.createdBy,
    this.createdDate,
    this.id,
    this.lastModifiedBy,
    this.lastModifiedDate,
    this.nome,
    this.numero,
    this.numeroFormatado,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        ativo: json["ativo"] == null ? null : json["ativo"],
        canceledAt: json["canceledAt"] == null
            ? null
            : DateTime.parse(json["canceledAt"]),
        clientes: json["clientes"] == null
            ? null
            : List<Cliente>.from(
                json["clientes"].map((x) => Cliente.fromJson(x))),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        id: json["id"] == null ? null : json["id"],
        lastModifiedBy:
            json["lastModifiedBy"] == null ? null : json["lastModifiedBy"],
        lastModifiedDate: json["lastModifiedDate"] == null
            ? null
            : DateTime.parse(json["lastModifiedDate"]),
        nome: json["nome"] == null ? null : json["nome"],
        numero: json["numero"] == null ? null : json["numero"],
        numeroFormatado:
            json["numeroFormatado"] == null ? null : json["numeroFormatado"],
      );

  Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "canceledAt": canceledAt == null ? null : canceledAt.toIso8601String(),
        "clientes": clientes == null
            ? null
            : List<dynamic>.from(clientes.map((x) => x.toJson())),
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate.toIso8601String(),
        "id": id == null ? null : id,
        "lastModifiedBy": lastModifiedBy == null ? null : lastModifiedBy,
        "lastModifiedDate": lastModifiedDate == null
            ? null
            : lastModifiedDate.toIso8601String(),
        "nome": nome == null ? null : nome,
        "numero": numero == null ? null : numero,
        "numeroFormatado": numeroFormatado == null ? null : numeroFormatado,
      };
}

class Usuario {
  final int id;
  final String login;
  final List<int> perfis;
  final String tipo;

  Usuario({
    this.id,
    this.login,
    this.perfis,
    this.tipo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"] == null ? null : json["id"],
        login: json["login"] == null ? null : json["login"],
        perfis: json["perfis"] == null
            ? null
            : List<int>.from(json["perfis"].map((x) => x)),
        tipo: json["tipo"] == null ? null : json["tipo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "login": login == null ? null : login,
        "perfis":
            perfis == null ? null : List<dynamic>.from(perfis.map((x) => x)),
        "tipo": tipo == null ? null : tipo,
      };
}

class DatasOsDto {
  final String chegadaNoCliente;
  final String dataContatoCliente;
  final String dataPlanejada;
  final String dataProgramada;
  final String saidaDoCliente;
  final String saidaParaCliente;

  DatasOsDto({
    this.chegadaNoCliente,
    this.dataContatoCliente,
    this.dataPlanejada,
    this.dataProgramada,
    this.saidaDoCliente,
    this.saidaParaCliente,
  });

  factory DatasOsDto.fromJson(Map<String, dynamic> json) => DatasOsDto(
        chegadaNoCliente:
            json["chegadaNoCliente"] == null ? null : json["chegadaNoCliente"],
        dataContatoCliente: json["dataContatoCliente"] == null
            ? null
            : json["dataContatoCliente"],
        dataPlanejada:
            json["dataPlanejada"] == null ? null : json["dataPlanejada"],
        dataProgramada:
            json["dataProgramada"] == null ? null : json["dataProgramada"],
        saidaDoCliente:
            json["saidaDoCliente"] == null ? null : json["saidaDoCliente"],
        saidaParaCliente:
            json["saidaParaCliente"] == null ? null : json["saidaParaCliente"],
      );

  Map<String, dynamic> toJson() => {
        "chegadaNoCliente": chegadaNoCliente == null ? null : chegadaNoCliente,
        "dataContatoCliente":
            dataContatoCliente == null ? null : dataContatoCliente,
        "dataPlanejada": dataPlanejada == null ? null : dataPlanejada,
        "dataProgramada": dataProgramada == null ? null : dataProgramada,
        "saidaDoCliente": saidaDoCliente == null ? null : saidaDoCliente,
        "saidaParaCliente": saidaParaCliente == null ? null : saidaParaCliente,
      };
}

class TipoAtendimentoOs {
  final String descricao;
  final int id;

  TipoAtendimentoOs({
    this.descricao,
    this.id,
  });

  factory TipoAtendimentoOs.fromJson(Map<String, dynamic> json) =>
      TipoAtendimentoOs(
        descricao: json["descricao"] == null ? null : json["descricao"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "descricao": descricao == null ? null : descricao,
        "id": id == null ? null : id,
      };
}
