// To parse this JSON data, do
//
//     final eventUserParticipated = eventUserParticipatedFromJson(jsonString);

import 'dart:convert';

List<EventUserParticipated> eventUserParticipatedFromJson(String str) => List<EventUserParticipated>.from(json.decode(str).map((x) => EventUserParticipated.fromJson(x)));

String eventUserParticipatedToJson(List<EventUserParticipated> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventUserParticipated {
    int id;
    String title;
    String slug;
    String cover;
    String content;
    int categoryId;
    int subtypeId;
    DateTime startDate;
    DateTime endDate;
    String startHour;
    String endHour;
    String address;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    int promotion;
    String tile;
    dynamic xp;
    dynamic trailId;

    EventUserParticipated({
        this.id,
        this.title,
        this.slug,
        this.cover,
        this.content,
        this.categoryId,
        this.subtypeId,
        this.startDate,
        this.endDate,
        this.startHour,
        this.endHour,
        this.address,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.promotion,
        this.tile,
        this.xp,
        this.trailId,
    });

    factory EventUserParticipated.fromJson(Map<String, dynamic> json) => EventUserParticipated(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        cover: json["cover"] == null ? null : json["cover"],
        content: json["content"] == null ? null : json["content"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        subtypeId: json["subtype_id"] == null ? null : json["subtype_id"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        startHour: json["start_hour"] == null ? null : json["start_hour"],
        endHour: json["end_hour"] == null ? null : json["end_hour"],
        address: json["address"] == null ? null : json["address"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotion: json["promotion"] == null ? null : json["promotion"],
        tile: json["tile"] == null ? null : json["tile"],
        xp: json["xp"],
        trailId: json["trail_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "cover": cover == null ? null : cover,
        "content": content == null ? null : content,
        "category_id": categoryId == null ? null : categoryId,
        "subtype_id": subtypeId == null ? null : subtypeId,
        "start_date": startDate == null ? null : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null ? null : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "start_hour": startHour == null ? null : startHour,
        "end_hour": endHour == null ? null : endHour,
        "address": address == null ? null : address,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "promotion": promotion == null ? null : promotion,
        "tile": tile == null ? null : tile,
        "xp": xp,
        "trail_id": trailId,
    };
}
