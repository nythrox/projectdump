// To parse this JSON data, do
//
//     final startTrailDto = startTrailDtoFromJson(jsonString);

import 'dart:convert';

StartTrailDto startTrailDtoFromJson(String str) => StartTrailDto.fromJson(json.decode(str));

String startTrailDtoToJson(StartTrailDto data) => json.encode(data.toJson());

class StartTrailDto {
    int eventId;
    DateTime startHour;
    DateTime endHour;

    StartTrailDto({
        this.eventId,
        this.startHour,
        this.endHour,
    });

    factory StartTrailDto.fromJson(Map<String, dynamic> json) => StartTrailDto(
        eventId: json["event_id"] == null ? null : json["event_id"],
        startHour: json["start_hour"] == null ? null : json["start_hour"],
        endHour: json["end_hour"] == null ? null : json["end_hour"],
    );

    Map<String, dynamic> toJson() => {
        "event_id": eventId == null ? null : eventId,
        "start_hour": startHour == null ? null : startHour,
        "end_hour": endHour == null ? null : endHour,
    };
}
