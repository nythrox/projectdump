class NewsResponse {
  List<News> news;

  NewsResponse({this.news});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = new List<News>();
      json['news'].forEach((v) {
        news.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  int id;
  String title;
  String content;
  String slug;
  int imageId;
  int categoryId;
  int status;
  String createdAt;
  String updatedAt;
  String cover;
  String category;
  String day;
  String month;
  String dateAdd;

  News(
      {this.id,
      this.title,
      this.content,
      this.slug,
      this.imageId,
      this.categoryId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.cover,
      this.category,
      this.day,
      this.month,
      this.dateAdd});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    imageId = json['image_id'];
    categoryId = json['category_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cover = json['cover'];
    category = json['category'];
    day = json['day'];
    month = json['month'];
    dateAdd = json['date_add'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['image_id'] = this.imageId;
    data['category_id'] = this.categoryId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cover'] = this.cover;
    data['category'] = this.category;
    data['day'] = this.day;
    data['month'] = this.month;
    data['date_add'] = this.dateAdd;
    return data;
  }
}
