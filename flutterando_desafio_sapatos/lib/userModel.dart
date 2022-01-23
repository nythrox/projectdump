// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String name;
    String profileUrl;

    User({
        this.name,
        this.profileUrl,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        profileUrl: json["profile_url"] == null ? null : json["profile_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "profile_url": profileUrl == null ? null : profileUrl,
    };
}
