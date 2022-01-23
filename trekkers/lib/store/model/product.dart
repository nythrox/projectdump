class ProductResponse {
  List<Product> products;

  ProductResponse({this.products});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Product>();
      json['products'].forEach((v) {
        products.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int id;
  int categoryId;
  String name;
  String type;
  String brand;
  String ean;
  String model;
  String description;
  double price;
  dynamic stock;
  int status;
  String createdAt;
  String updatedAt;
  List<ProductColor> colors;
  List<Photo> images;
  List<Variations> variations;

  Product(
      {this.id,
      this.categoryId,
      this.name,
      this.type,
      this.brand,
      this.ean,
      this.model,
      this.description,
      this.price,
      this.stock,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.colors,
      this.images,
      this.variations});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    type = json['type'];
    brand = json['brand'];
    ean = json['ean'];
    model = json['model'];
    description = json['description'];
    price = double.parse(json['price']);
    stock = json['stock'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['colors'] != null) {
      colors = new List<ProductColor>();
      json['colors'].forEach((v) {
        colors.add(new ProductColor.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Photo>();
      json['images'].forEach((v) {
        images.add(new Photo.fromJson(v));
      });
    }
    if (json['variations'] != null) {
      variations = new List<Variations>();
      json['variations'].forEach((v) {
        variations.add(new Variations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['brand'] = this.brand;
    data['ean'] = this.ean;
    data['model'] = this.model;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.colors != null) {
      data['colors'] = this.colors.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.variations != null) {
      data['variations'] = this.variations.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(other) =>
      other is Product &&
      other.id == this.id &&
      other.name == name &&
      other.description == description &&
      other.price == price;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
}

class ProductColor {
  int id;
  String code;
  String name;
  String hex;
  int status;
  String createdAt;
  String updatedAt;

  ProductColor(
      {this.id,
      this.code,
      this.name,
      this.hex,
      this.status,
      this.createdAt,
      this.updatedAt});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    hex = json['hex'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['hex'] = this.hex;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Photo {
  int id;
  String link;
  int status;
  String createdAt;
  String updatedAt;

  Photo({this.id, this.link, this.status, this.createdAt, this.updatedAt});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Variations {
  int id;
  String name;
  String value;
  int stock;
  int status;
  int productId;
  String createdAt;
  String updatedAt;

  Variations(
      {this.id,
      this.name,
      this.value,
      this.stock,
      this.status,
      this.productId,
      this.createdAt,
      this.updatedAt});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    value = json['value'];
    stock = json['stock'];
    status = json['status'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['value'] = this.value;
    data['stock'] = this.stock;
    data['status'] = this.status;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
