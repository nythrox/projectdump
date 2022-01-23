
class Pivot {

  int eventId;
  int imageId;

	Pivot.fromJsonMap(Map<String, dynamic> map): 
		eventId = map["event_id"],
		imageId = map["image_id"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['event_id'] = eventId;
		data['image_id'] = imageId;
		return data;
	}
}
