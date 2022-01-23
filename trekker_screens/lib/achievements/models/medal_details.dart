// To parse this JSON data, do
//
//     final medalDetails = medalDetailsFromJson(jsonString);

import 'dart:convert';

MedalDetails medalDetailsFromJson(String str) => MedalDetails.fromJson(json.decode(str));

String medalDetailsToJson(MedalDetails data) => json.encode(data.toJson());

class MedalDetails {
    int id;
    int parentId;
    String name;
    String image;
    String description;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    List<MedalDetails> children;
    int completed;

    MedalDetails({
        this.id,
        this.parentId,
        this.name,
        this.image,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.children,
        this.completed,
    });

    factory MedalDetails.fromJson(Map<String, dynamic> json) => MedalDetails(
        id: json["id"] == null ? null : json["id"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        children: json["children"] == null ? null : List<MedalDetails>.from(json["children"].map((x) => MedalDetails.fromJson(x))),
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
        "children": children == null ? null : List<dynamic>.from(children.map((x) => x.toJson())),
        "completed": completed == null ? null : completed,
    };
}
