// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    String title;
    double rating;
    int sales;
    double profit;
    String imageUrl;

    Product({
        this.title,
        this.rating,
        this.sales,
        this.profit,
        this.imageUrl,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"] == null ? null : json["title"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        sales: json["sales"] == null ? null : json["sales"],
        profit: json["profit"] == null ? null : json["profit"].toDouble(),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "rating": rating == null ? null : rating,
        "sales": sales == null ? null : sales,
        "profit": profit == null ? null : profit,
        "image_url": imageUrl == null ? null : imageUrl,
    };
}
