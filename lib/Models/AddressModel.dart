class Address {
  int? addressId;
  String? address;
  String? country;
  String? state;
  String? city;
  int? postcode;
  String? shopLatitude;
  String? shopLongitude;
  String? flatRate;
  String? forFirst;
  String? everyAdditional;

  Address(
      {this.addressId,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postcode,
      this.shopLatitude,
      this.shopLongitude,
      this.flatRate,
      this.forFirst,
      this.everyAdditional});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressId: json['addressId'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postcode: json['postcode'],
      shopLatitude: json['shop_latitude'],
      shopLongitude: json['shop_longitude'],
      flatRate: json['flat_rate'],
      forFirst: json['for_first'],
      everyAdditional: json['every_additional'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addressId'] = this.addressId;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['shop_latitude'] = this.shopLatitude;
    data['shop_longitude'] = this.shopLongitude;
    data['flat_rate'] = this.flatRate;
    data['for_first'] = this.forFirst;
    data['every_additional'] = this.everyAdditional;
    return data;
  }
}
