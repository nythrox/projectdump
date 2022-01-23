
class Variations {

  int id;
  String name;
  String value;
  int stock;
  String price;
  int productId;
  int status;
  String createdAt;
  String updatedAt;

	Variations.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		value = map["value"],
		stock = map["stock"],
		price = map["price"],
		productId = map["product_id"],
		status = map["status"],
		createdAt = map["created_at"],
		updatedAt = map["updated_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['value'] = value;
		data['stock'] = stock;
		data['price'] = price;
		data['product_id'] = productId;
		data['status'] = status;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		return data;
	}
}
