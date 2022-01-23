import 'package:trekkers/datas/loja/colors.dart';
import 'package:trekkers/datas/loja/images.dart';
import 'package:trekkers/datas/loja/variations.dart';

class ProductData {

  int id;
  int categoryId;
  String name;
  String type;
  String brand;
  Object ean;
  String model;
  String description;
  Object price;
  Object stock;
  int status;
  String createdAt;
  String updatedAt;
  List<Colors> colors;
  List<Images> images;
  List<Variations> variations;

  ProductData.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        categoryId = map["category_id"],
        name = map["name"],
        type = map["type"],
        brand = map["brand"],
        ean = map["ean"],
        model = map["model"],
        description = map["description"],
        price = map["price"],
        stock = map["stock"],
        status = map["status"],
        createdAt = map["created_at"],
        updatedAt = map["updated_at"],
        colors = List<Colors>.from(map["colors"].map((it) => Colors.fromJsonMap(it))),
        images = List<Images>.from(map["images"].map((it) => Images.fromJsonMap(it))),
        variations = List<Variations>.from(map["variations"].map((it) => Variations.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['type'] = type;
    data['brand'] = brand;
    data['ean'] = ean;
    data['model'] = model;
    data['description'] = description;
    data['price'] = price;
    data['stock'] = stock;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['colors'] = colors != null ?
    this.colors.map((v) => v.toJson()).toList()
        : null;
    data['images'] = images != null ?
    this.images.map((v) => v.toJson()).toList()
        : null;
    data['variations'] = variations != null ?
    this.variations.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
