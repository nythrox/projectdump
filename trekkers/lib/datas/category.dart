class CategoryData {
  int id;
  String title;
  String slug;
  String type;
  int status;
  String createdAt;
  String updatedAt;

  CategoryData(
      {this.id,
      this.title,
      this.slug,
      this.type,
      this.status,
      this.createdAt,
      this.updatedAt});

  CategoryData.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        slug = map["slug"],
        type = map["type"],
        status = map["status"],
        createdAt = map["created_at"],
        updatedAt = map["updated_at"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
