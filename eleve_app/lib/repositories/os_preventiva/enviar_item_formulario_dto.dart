// To parse this JSON data, do
//
//     final enviarItemFormularioDto = enviarItemFormularioDtoFromJson(jsonString);

import 'dart:convert';

EnviarItemFormularioDto enviarItemFormularioDtoFromJson(String str) => EnviarItemFormularioDto.fromJson(json.decode(str));

String enviarItemFormularioDtoToJson(EnviarItemFormularioDto data) => json.encode(data.toJson());

class EnviarItemFormularioDto {
    final int acaoRealizada;
    final int opcaoFormulario;
    final int osRespostaId;
    final int situacaoPosPreventiva;

    EnviarItemFormularioDto({
        this.acaoRealizada,
        this.opcaoFormulario,
        this.osRespostaId,
        this.situacaoPosPreventiva,
    });

    factory EnviarItemFormularioDto.fromJson(Map<String, dynamic> json) => EnviarItemFormularioDto(
        acaoRealizada: json["acaoRealizada"] == null ? null : json["acaoRealizada"],
        opcaoFormulario: json["opcaoFormulario"] == null ? null : json["opcaoFormulario"],
        osRespostaId: json["osRespostaId"] == null ? null : json["osRespostaId"],
        situacaoPosPreventiva: json["situacaoPosPreventiva"] == null ? null : json["situacaoPosPreventiva"],
    );

    Map<String, dynamic> toJson() => {
        "acaoRealizada": acaoRealizada == null ? null : acaoRealizada,
        "opcaoFormulario": opcaoFormulario == null ? null : opcaoFormulario,
        "osRespostaId": osRespostaId == null ? null : osRespostaId,
        "situacaoPosPreventiva": situacaoPosPreventiva == null ? null : situacaoPosPreventiva,
    };
}
