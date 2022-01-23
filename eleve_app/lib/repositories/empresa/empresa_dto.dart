// To parse this JSON data, do
//
//     final empresaDto = empresaDtoFromJson(jsonString);

import 'dart:convert';

List<EmpresaDto> empresaDtoFromJson(String str) => List<EmpresaDto>.from(json.decode(str).map((x) => EmpresaDto.fromJson(x)));

String empresaDtoToJson(List<EmpresaDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmpresaDto {
    final bool ativo;
    final List<Cliente> clientes;
    final int id;
    final String nome;
    final int numero;

    EmpresaDto({
        this.ativo,
        this.clientes,
        this.id,
        this.nome,
        this.numero,
    });

    factory EmpresaDto.fromJson(Map<String, dynamic> json) => EmpresaDto(
        ativo: json["ativo"] == null ? null : json["ativo"],
        clientes: json["clientes"] == null ? null : List<Cliente>.from(json["clientes"].map((x) => Cliente.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        numero: json["numero"] == null ? null : json["numero"],
    );

    Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "clientes": clientes == null ? null : List<dynamic>.from(clientes.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "numero": numero == null ? null : numero,
    };
}

class Cliente {
    final bool ativo;
    final String cnpj;
    final List<EnderecoElement> enderecos;
    final int id;
    final String inscricaoEstadual;
    final String nome;

    Cliente({
        this.ativo,
        this.cnpj,
        this.enderecos,
        this.id,
        this.inscricaoEstadual,
        this.nome,
    });

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        ativo: json["ativo"] == null ? null : json["ativo"],
        cnpj: json["cnpj"] == null ? null : json["cnpj"],
        enderecos: json["enderecos"] == null ? null : List<EnderecoElement>.from(json["enderecos"].map((x) => EnderecoElement.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        inscricaoEstadual: json["inscricaoEstadual"] == null ? null : json["inscricaoEstadual"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "ativo": ativo == null ? null : ativo,
        "cnpj": cnpj == null ? null : cnpj,
        "enderecos": enderecos == null ? null : List<dynamic>.from(enderecos.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "inscricaoEstadual": inscricaoEstadual == null ? null : inscricaoEstadual,
        "nome": nome == null ? null : nome,
    };
}

class EnderecoElement {
    final EnderecoEndereco endereco;
    final int id;

    EnderecoElement({
        this.endereco,
        this.id,
    });

    factory EnderecoElement.fromJson(Map<String, dynamic> json) => EnderecoElement(
        endereco: json["endereco"] == null ? null : EnderecoEndereco.fromJson(json["endereco"]),
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "endereco": endereco == null ? null : endereco.toJson(),
        "id": id == null ? null : id,
    };
}

class EnderecoEndereco {
    final String bairro;
    final String cep;
    final Cidade cidade;
    final String complemento;
    final Estado estado;
    final String logradouro;
    final String numero;

    EnderecoEndereco({
        this.bairro,
        this.cep,
        this.cidade,
        this.complemento,
        this.estado,
        this.logradouro,
        this.numero,
    });

    factory EnderecoEndereco.fromJson(Map<String, dynamic> json) => EnderecoEndereco(
        bairro: json["bairro"] == null ? null : json["bairro"],
        cep: json["cep"] == null ? null : json["cep"],
        cidade: json["cidade"] == null ? null : Cidade.fromJson(json["cidade"]),
        complemento: json["complemento"] == null ? null : json["complemento"],
        estado: json["estado"] == null ? null : Estado.fromJson(json["estado"]),
        logradouro: json["logradouro"] == null ? null : json["logradouro"],
        numero: json["numero"] == null ? null : json["numero"],
    );

    Map<String, dynamic> toJson() => {
        "bairro": bairro == null ? null : bairro,
        "cep": cep == null ? null : cep,
        "cidade": cidade == null ? null : cidade.toJson(),
        "complemento": complemento == null ? null : complemento,
        "estado": estado == null ? null : estado.toJson(),
        "logradouro": logradouro == null ? null : logradouro,
        "numero": numero == null ? null : numero,
    };
}

class Cidade {
    final Estado estado;
    final int id;
    final String nome;

    Cidade({
        this.estado,
        this.id,
        this.nome,
    });

    factory Cidade.fromJson(Map<String, dynamic> json) => Cidade(
        estado: json["estado"] == null ? null : Estado.fromJson(json["estado"]),
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "estado": estado == null ? null : estado.toJson(),
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
    };
}

class Estado {
    final int id;
    final String nome;

    Estado({
        this.id,
        this.nome,
    });

    factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
    };
}
