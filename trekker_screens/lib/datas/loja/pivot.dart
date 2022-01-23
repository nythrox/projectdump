
class Pivot {

  int productId;
  int colorId;

	Pivot.fromJsonMap(Map<String, dynamic> map): 
		productId = map["product_id"],
		colorId = map["color_id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['product_id'] = productId;
		data['color_id'] = colorId;
		return data;
	}
}
