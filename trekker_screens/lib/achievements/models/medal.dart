// To parse this JSON data, do
//
//     final medal = medalFromJson(jsonString);

import 'dart:convert';

List<Medal> medalFromJson(String str) => List<Medal>.from(json.decode(str).map((x) => Medal.fromJson(x)));

String medalToJson(List<Medal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medal {
    int id;
    int parentId;
    String name;
    String image;
    String description;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    int completed;

    Medal({
        this.id,
        this.parentId,
        this.name,
        this.image,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.completed,
    });

    factory Medal.fromJson(Map<String, dynamic> json) => Medal(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        completed: json["completed"] == null ? null : json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "parent_id": parentId == null ? null : parentId,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "completed": completed == null ? null : completed,
    };
}
