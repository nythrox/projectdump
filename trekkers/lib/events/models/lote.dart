// To parse this JSON data, do
//
//     final lote = loteFromJson(jsonString);

import 'dart:convert';

List<Lote> loteFromJson(String str) => List<Lote>.from(json.decode(str).map((x) => Lote.fromJson(x)));

String loteToJson(List<Lote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Lote {
    int lot;
    String description;
    List<LoteUser> users;

    Lote({
        this.lot,
        this.description,
        this.users,
    });

    factory Lote.fromJson(Map<String, dynamic> json) => Lote(
        lot: json["lot"] == null ? null : json["lot"],
        description: json["description"] == null ? null : json["description"],
        users: json["users"] == null ? null : List<LoteUser>.from(json["users"].map((x) => LoteUser.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lot": lot == null ? null : lot,
        "description": description == null ? null : description,
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class LoteUser {
    String userName;
    String userAvatar;
    int status;
    String qrCode;

    LoteUser({
        this.userName,
        this.userAvatar,
        this.status,
        this.qrCode,
    });

    factory LoteUser.fromJson(Map<String, dynamic> json) => LoteUser(
        userName: json["user_name"] == null ? null : json["user_name"],
        userAvatar: json["user_avatar"] == null ? null : json["user_avatar"],
        status: json["status"] == null ? null : json["status"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName == null ? null : userName,
        "user_avatar": userAvatar == null ? null : userAvatar,
        "status": status == null ? null : status,
        "qr_code": qrCode == null ? null : qrCode,
    };
}
