import 'package:trekkers/shared/models/iuser.dart';

class Customer implements User {
  final int _id;
  final String _email;
  final String _name;
  final String _avatar;

  Customer(this._id, this._email, this._name, this._avatar);

  @override
  int get id => _id;

  @override
  String get email => _email;

  @override
  String get name => _name;

  @override
  String get avatar => _avatar;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        json["id"],
        json["name"],
        json["avatar"],
        json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": _id,
        "name": _name,
        "avatar": _avatar,
        "email": _email,
      };
}
