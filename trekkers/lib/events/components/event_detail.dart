// To parse this JSON data, do
//
//     final eventDetail = eventDetailFromJson(jsonString);

import 'dart:convert';

EventDetail eventDetailFromJson(String str) => EventDetail.fromJson(json.decode(str));

String eventDetailToJson(EventDetail data) => json.encode(data.toJson());

class EventDetail {
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
    String day;
    String month;
    List<Image> images;
    Category category;
    List<Ticket> tickets;
    List<Info> info;

    EventDetail({
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
        this.day,
        this.month,
        this.images,
        this.category,
        this.tickets,
        this.info,
    });

    factory EventDetail.fromJson(Map<String, dynamic> json) => EventDetail(
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
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        tickets: json["tickets"] == null ? null : List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
        info: json["info"] == null ? null : List<Info>.from(json["info"].map((x) => Info.fromJson(x))),
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
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
        "category": category == null ? null : category.toJson(),
        "tickets": tickets == null ? null : List<dynamic>.from(tickets.map((x) => x.toJson())),
        "info": info == null ? null : List<dynamic>.from(info.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String title;
    String slug;
    String type;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    Category({
        this.id,
        this.title,
        this.slug,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        slug: json["slug"] == null ? null : json["slug"],
        type: json["type"] == null ? null : json["type"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "slug": slug == null ? null : slug,
        "type": type == null ? null : type,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class Image {
    int id;
    String link;
    int status;
    DateTime createdAt;
    DateTime updatedAt;
    Pivot pivot;

    Image({
        this.id,
        this.link,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.pivot,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] == null ? null : json["id"],
        link: json["link"] == null ? null : json["link"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "link": link == null ? null : link,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pivot": pivot == null ? null : pivot.toJson(),
    };
}

class Pivot {
    int eventId;
    int imageId;

    Pivot({
        this.eventId,
        this.imageId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        eventId: json["event_id"] == null ? null : json["event_id"],
        imageId: json["image_id"] == null ? null : json["image_id"],
    );

    Map<String, dynamic> toJson() => {
        "event_id": eventId == null ? null : eventId,
        "image_id": imageId == null ? null : imageId,
    };
}

class Info {
    int id;
    String title;
    String content;
    int odr;
    int eventId;
    int status;
    DateTime createdAt;
    DateTime updatedAt;

    Info({
        this.id,
        this.title,
        this.content,
        this.odr,
        this.eventId,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        odr: json["odr"] == null ? null : json["odr"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "odr": odr == null ? null : odr,
        "event_id": eventId == null ? null : eventId,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    };
}

class Ticket {
    int id;
    int lot;
    String price;
    String description;
    int discount;
    int discountPercent;
    int amount;
    DateTime startDate;
    DateTime endDate;
    int odr;
    int status;
    int eventId;
    DateTime createdAt;
    DateTime updatedAt;
    int sold;

    Ticket({
        this.id,
        this.lot,
        this.price,
        this.description,
        this.discount,
        this.discountPercent,
        this.amount,
        this.startDate,
        this.endDate,
        this.odr,
        this.status,
        this.eventId,
        this.createdAt,
        this.updatedAt,
        this.sold,
    });

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"] == null ? null : json["id"],
        lot: json["lot"] == null ? null : json["lot"],
        price: json["price"] == null ? null : json["price"],
        description: json["description"] == null ? null : json["description"],
        discount: json["discount"] == null ? null : json["discount"],
        discountPercent: json["discount_percent"] == null ? null : json["discount_percent"],
        amount: json["amount"] == null ? null : json["amount"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        odr: json["odr"] == null ? null : json["odr"],
        status: json["status"] == null ? null : json["status"],
        eventId: json["event_id"] == null ? null : json["event_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        sold: json["sold"] == null ? null : json["sold"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "lot": lot == null ? null : lot,
        "price": price == null ? null : price,
        "description": description == null ? null : description,
        "discount": discount == null ? null : discount,
        "discount_percent": discountPercent == null ? null : discountPercent,
        "amount": amount == null ? null : amount,
        "start_date": startDate == null ? null : "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null ? null : "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "odr": odr == null ? null : odr,
        "status": status == null ? null : status,
        "event_id": eventId == null ? null : eventId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "sold": sold == null ? null : sold,
    };
}
