
import 'dart:convert';

import 'package:flutterando_desafio_sapatos/productModel.dart';
import 'package:flutterando_desafio_sapatos/userModel.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
    User user;
    Product product;
    int rating;
    String comment;

    Comment({
        this.user,
        this.product,
        this.rating,
        this.comment,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        comment: json["comment"] == null ? null : json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
        "product": product == null ? null : product.toJson(),
        "rating": rating == null ? null : rating,
        "comment": comment == null ? null : comment,
    };
}
