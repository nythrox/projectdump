import 'package:trekkers/datas/evento/images.dart';
import 'package:trekkers/datas/category.dart';
import 'package:trekkers/datas/evento/tickets.dart';

class EventData {

  int id;
  String title;
  int categoryId;
  String startDate;
  String endDate;
  String startHour;
  String endHour;
  int status;
  String createdAt;
  String updatedAt;
  String day;
  String month;
  String cover;
  List<Images> images;
  CategoryData category;
  List<Tickets> tickets;

	EventData.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		title = map["title"],
		categoryId = map["category_id"],
		startDate = map["start_date"],
		endDate = map["end_date"],
		startHour = map["start_hour"],
		endHour = map["end_hour"],
		status = map["status"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"],
		day = map["day"],
		month = map["month"],
		cover = map["cover"],
		images = List<Images>.from(map["images"].map((it) => Images.fromJsonMap(it)))
		//category = Category.fromJsonMap(map["category"]),
		//tickets = List<Tickets>.from(map["tickets"].map((it) => Tickets.fromJsonMap(it)))
	;

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['title'] = title;
		data['category_id'] = categoryId;
		data['start_date'] = startDate;
		data['end_date'] = endDate;
		data['start_hour'] = startHour;
		data['end_hour'] = endHour;
		data['status'] = status;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['day'] = day;
		data['month'] = month;
		data['cover'] = cover;
		data['images'] = images != null ? 
			this.images.map((v) => v.toJson()).toList()
			: null;
		data['category'] = category == null ? null : category.toJson();
		data['tickets'] = tickets != null ? 
			this.tickets.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
