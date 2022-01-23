// To parse this JSON data, do
//
//     final friend = friendFromJson(jsonString);

import 'dart:convert';

List<Friend> friendFromJson(List<dynamic> str) => List<Friend>.from(str.map((x) => Friend.fromJson(x)));

String friendToJson(List<Friend> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Friend {
    int id;
    String name;
    String avatar;
    String role;
    String email;
    dynamic emailVerifiedAt;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    String phone;
    int cityId;

    Friend({
        this.id,
        this.name,
        this.avatar,
        this.role,
        this.email,
        this.emailVerifiedAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.phone,
        this.cityId,
    });

    factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        role: json["role"] == null ? null : json["role"],
        email: json["email"] == null ? null : json["email"],
        emailVerifiedAt: json["email_verified_at"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        phone: json["phone"] == null ? null : json["phone"],
        cityId: json["city_id"] == null ? null : json["city_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "role": role == null ? null : role,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "phone": phone == null ? null : phone,
        "city_id": cityId == null ? null : cityId,
    };
}
