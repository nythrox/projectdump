class CouponDto {
  int order;
  String code;

  CouponDto({this.order, this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['code'] = this.code;
    return data;
  }
}