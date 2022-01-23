import 'package:trekkers/datas/loja/pivot.dart';

class Images {

  int id;
  String link;
  int status;
  String createdAt;
  String updatedAt;
  Pivot pivot;

	Images.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		link = map["link"],
		status = map["status"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"],
		pivot = Pivot.fromJsonMap(map["pivot"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['link'] = link;
		data['status'] = status;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['pivot'] = pivot == null ? null : pivot.toJson();
		return data;
	}
}
