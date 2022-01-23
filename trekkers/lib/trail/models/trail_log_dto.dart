// To parse this JSON data, do
//
//     final TrailLogDto = trailLogFromJson(jsonString);

import 'dart:convert';

TrailLogDto trailLogDtoFromJson(String str) => TrailLogDto.fromJson(json.decode(str));

String trailLogDtoToJson(TrailLogDto data) => json.encode(data.toJson());

class TrailLogDto {
    int trailId;
    String lat;
    int long;
    String hour;

    TrailLogDto({
        this.trailId,
        this.lat,
        this.long,
        this.hour,
    });

    factory TrailLogDto.fromJson(Map<String, dynamic> json) => TrailLogDto(
        trailId: json["trail_id"] == null ? null : json["trail_id"],
        lat: json["lat"] == null ? null : json["lat"],
        long: json["long"] == null ? null : json["long"],
        hour: json["hour"] == null ? null : json["hour"],
    );

    Map<String, dynamic> toJson() => {
        "trail_id": trailId == null ? null : trailId,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "hour": hour == null ? null : hour,
    };
}
