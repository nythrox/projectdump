import 'package:trekkers/datas/loja/pivot.dart';

class Colors {

  int id;
  String code;
  String name;
  String hex;
  int status;
  String createdAt;
  String updatedAt;
  Pivot pivot;

	Colors.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		code = map["code"],
		name = map["name"],
		hex = map["hex"],
		status = map["status"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"],
		pivot = Pivot.fromJsonMap(map["pivot"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['code'] = code;
		data['name'] = name;
		data['hex'] = hex;
		data['status'] = status;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['pivot'] = pivot == null ? null : pivot.toJson();
		return data;
	}
}
