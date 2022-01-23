// To parse this JSON data, do
//
//     final relatorioTrilha = relatorioTrilhaFromJson(jsonString);

import 'dart:convert';

RelatorioTrilha relatorioTrilhaFromJson(String str) => RelatorioTrilha.fromJson(json.decode(str));

String relatorioTrilhaToJson(RelatorioTrilha data) => json.encode(data.toJson());

class RelatorioTrilha {
    int id;
    int userId;
    int eventId;
    DateTime startHour;
    dynamic endHour;
    DateTime createdAt;
    DateTime updatedAt;
    List<TrilhaLog> logs;
    dynamic report;

    RelatorioTrilha({
        this.id,
        this.userId,
        this.eventId,
        this.startHour,
        this.endHour,
        this.createdAt,
        this.updatedAt,
        this.logs,
        this.report,
    });

    factory RelatorioTrilha.fromJson(Map<String, dynamic> json) => RelatorioTrilha(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        startHour: json["start_hour"] == null ? null : DateTime.parse(json["start_hour"]),
        endHour: json["end_hour"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        logs: json["logs"] == null ? null : List<TrilhaLog>.from(json["logs"].map((x) => TrilhaLog.fromJson(x))),
        report: json["report"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "event_id": eventId == null ? null : eventId,
        "start_hour": startHour == null ? null : startHour.toIso8601String(),
        "end_hour": endHour,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "logs": logs == null ? null : List<dynamic>.from(logs.map((x) => x.toJson())),
        "report": report,
    };
}

class TrilhaLog {
    int id;
    int trailId;
    String lat;
    String long;
    DateTime hour;
    DateTime createdAt;
    DateTime updatedAt;

    TrilhaLog({
        this.id,
        this.trailId,
        this.lat,
        this.long,
        this.hour,
        this.createdAt,
        this.updatedAt,
    });

    factory TrilhaLog.fromJson(Map<String, dynamic> json) => TrilhaLog(
        id: json["id"] == null ? null : json["id"],
        trailId: json["trail_id"] == null ? null : json["trail_id"],
        lat: json["lat"] == null ? null : json["lat"],
        long: json["long"] == null ? null : json["long"],
        hour: json["hour"] == null ? null : DateTime.parse(json["hour"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "trail_id": trailId == null ? null : trailId,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "hour": hour == null ? null : hour.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}
