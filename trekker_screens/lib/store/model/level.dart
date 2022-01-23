class LevelResponse {
  List<Level> levels;

  LevelResponse({this.levels});

  LevelResponse.fromJson(Map<String, dynamic> json) {
    if (json['levels'] != null) {
      levels = new List<Level>();
      json['levels'].forEach((v) {
        levels.add(new Level.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Level {
  int id;
  String name;
  String image;
  int minPoints;
  int maxPoints;
  String description;
  int status;
  String createdAt;
  String updatedAt;
  int completed;
  List<PreRequisits> preRequisits;

  Level(
      {this.id,
      this.name,
      this.image,
      this.minPoints,
      this.maxPoints,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.completed,
      this.preRequisits});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    minPoints = json['min_points'];
    maxPoints = json['max_points'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completed = json['completed'];
    if (json['pre_requisits'] != null) {
      preRequisits = new List<PreRequisits>();
      json['pre_requisits'].forEach((v) {
        preRequisits.add(new PreRequisits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['min_points'] = this.minPoints;
    data['max_points'] = this.maxPoints;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['completed'] = this.completed;
    if (this.preRequisits != null) {
      data['pre_requisits'] = this.preRequisits.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreRequisits {
  String title;
  String completed;
  int id;
  String slug;
  String cover;
  String content;
  int categoryId;
  int subtypeId;
  String startDate;
  String endDate;
  String startHour;
  String endHour;
  String address;
  int status;
  String createdAt;
  String updatedAt;
  int promotion;
  String tile;
  Null xp;
  Pivot pivot;

  PreRequisits(
      {this.title,
      this.completed,
      this.id,
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
      this.pivot});

  PreRequisits.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    completed = json['completed'];
    id = json['id'];
    slug = json['slug'];
    cover = json['cover'];
    content = json['content'];
    categoryId = json['category_id'];
    subtypeId = json['subtype_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startHour = json['start_hour'];
    endHour = json['end_hour'];
    address = json['address'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotion = json['promotion'];
    tile = json['tile'];
    xp = json['xp'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['completed'] = this.completed;
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['cover'] = this.cover;
    data['content'] = this.content;
    data['category_id'] = this.categoryId;
    data['subtype_id'] = this.subtypeId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_hour'] = this.startHour;
    data['end_hour'] = this.endHour;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promotion'] = this.promotion;
    data['tile'] = this.tile;
    data['xp'] = this.xp;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int levelId;
  int eventId;

  Pivot({this.levelId, this.eventId});

  Pivot.fromJson(Map<String, dynamic> json) {
    levelId = json['level_id'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level_id'] = this.levelId;
    data['event_id'] = this.eventId;
    return data;
  }
}
