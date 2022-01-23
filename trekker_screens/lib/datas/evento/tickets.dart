
class Tickets {

  int id;
  int lot;
  String description;
  String price;
  int discount;
  int discountPercent;
  int amount;
  String startDate;
  String endDate;
  int odr;
  int eventId;
  int status;
  String createdAt;
  String updatedAt;

	Tickets.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		lot = map["lot"],
		description = map["description"],
		price = map["price"],
		discount = map["discount"],
		discountPercent = map["discount_percent"],
		amount = map["amount"],
		startDate = map["start_date"],
		endDate = map["end_date"],
		odr = map["odr"],
		eventId = map["event_id"],
		status = map["status"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['lot'] = lot;
		data['description'] = description;
		data['price'] = price;
		data['discount'] = discount;
		data['discount_percent'] = discountPercent;
		data['amount'] = amount;
		data['start_date'] = startDate;
		data['end_date'] = endDate;
		data['odr'] = odr;
		data['event_id'] = eventId;
		data['status'] = status;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		return data;
	}
}
