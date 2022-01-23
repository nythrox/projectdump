class Ticket {
  int id;
  int lot;
  String price;
  String description;
  int discount;
  int discountPercent;
  int amount;
  DateTime startDate;
  DateTime endDate;
  int odr;
  int status;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;

  Ticket(
      {this.id,
      this.lot,
      this.price,
      this.description,
      this.discount,
      this.discountPercent,
      this.amount,
      this.startDate,
      this.endDate,
      this.odr,
      this.status,
      this.eventId,
      this.createdAt,
      this.updatedAt});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lot = json['lot'];
    price = json['price'];
    description = json['description'];
    discount = json['discount'];
    discountPercent = json['discount_percent'];
    amount = json['amount'];
    startDate = DateTime.parse(json['start_date']);
    endDate = DateTime.parse(json['end_date']);
    odr = json['odr'];
    status = json['status'];
    eventId = json['event_id'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lot'] = this.lot;
    data['price'] = this.price;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['discount_percent'] = this.discountPercent;
    data['amount'] = this.amount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['odr'] = this.odr;
    data['status'] = this.status;
    data['event_id'] = this.eventId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
