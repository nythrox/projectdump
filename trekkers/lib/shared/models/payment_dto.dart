

class PaymentDto {
  int user;
  String senderName;
  String senderPhone;
  String senderEmail;
  String senderHash;
  String senderCPF;
  String senderBirthDate;
  String shippingAddressStreet;
  int shippingAddressNumber;
  String shippingAddressDistrict;
  String shippingAddressPostalCode;
  String shippingAddressCity;
  String shippingAddressState;
  String creditCardToken;
  int installmentQuantity;
  double installmentValue;

  PaymentDto(
      {this.user,
      this.senderName,
      this.senderPhone,
      this.senderEmail,
      this.senderHash,
      this.senderCPF,
      this.senderBirthDate,
      this.shippingAddressStreet,
      this.shippingAddressNumber,
      this.shippingAddressDistrict,
      this.shippingAddressPostalCode,
      this.shippingAddressCity,
      this.shippingAddressState,
      this.creditCardToken,
      this.installmentQuantity,
      this.installmentValue});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['senderName'] = this.senderName;
    data['senderPhone'] = this.senderPhone;
    data['senderEmail'] = this.senderEmail;
    data['senderHash'] = this.senderHash;
    data['senderCPF'] = this.senderCPF;
    data['senderBirthDate'] = this.senderBirthDate;
    data['shippingAddressStreet'] = this.shippingAddressStreet;
    data['shippingAddressNumber'] = this.shippingAddressNumber;
    data['shippingAddressDistrict'] = this.shippingAddressDistrict;
    data['shippingAddressPostalCode'] = this.shippingAddressPostalCode;
    data['shippingAddressCity'] = this.shippingAddressCity;
    data['shippingAddressState'] = this.shippingAddressState;
    data['creditCardToken'] = this.creditCardToken;
    data['installmentQuantity'] = this.installmentQuantity;
    data['installmentValue'] = this.installmentValue;
    return data;
  }
}
