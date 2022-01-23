class EventResponse {
  List<Event> events;

  EventResponse({this.events});

  EventResponse.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = new List<Event>();
      json['events'].forEach((v) {
        events.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  int id;
  String title;
  String slug;
  String cover;
  String content;
  int categoryId;
  String startDate;
  String endDate;
  String startHour;
  String endHour;
  String address;
  int status;
  String createdAt;
  String updatedAt;
  String category;
  String day;
  String month;
  List<Images> images;

  Event(
      {this.id,
      this.title,
      this.slug,
      this.cover,
      this.content,
      this.categoryId,
      this.startDate,
      this.endDate,
      this.startHour,
      this.endHour,
      this.address,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.day,
      this.month,
      this.images});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    cover = json['cover'];
    content = json['content'];
    categoryId = json['category_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startHour = json['start_hour'];
    endHour = json['end_hour'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'];
    day = json['day'];
    month = json['month'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['cover'] = this.cover;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_hour'] = this.startHour;
    data['end_hour'] = this.endHour;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category'] = this.category;
    data['day'] = this.day;
    data['month'] = this.month;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String link;
  int status;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Images(
      {this.id,
      this.link,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int eventId;
  int imageId;

  Pivot({this.eventId, this.imageId});

  Pivot.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = this.eventId;
    data['image_id'] = this.imageId;
    return data;
  }
}
