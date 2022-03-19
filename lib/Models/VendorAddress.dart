class VendorAddress {
  int? vendorAddressId;
  String? vendorAddress;
  String? country;
  String? state;
  String? city;
  String? postCode;
  String? businessLatitude;
  String? businessLongitude;
  String? isPublished;

  VendorAddress({
    this.vendorAddressId,
    this.vendorAddress,
    this.country,
    this.state,
    this.city,
    this.postCode,
    this.businessLatitude,
    this.businessLongitude,
    this.isPublished,
  });

  factory VendorAddress.fromJson(Map<String, dynamic> json) {
    return VendorAddress(
      vendorAddressId: json['vendorAddressId'],
      vendorAddress: json['vendorAddress'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postCode: json['postCode'],
      businessLatitude: json['businessLatitude'],
      businessLongitude: json['businessLongitude'],
      isPublished: json['isPublished'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorAddressId'] = this.vendorAddressId;
    data['vendorAddress'] = this.vendorAddress;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postCode'] = this.postCode;
    data['businessLatitude'] = this.businessLatitude;
    data['businessLongitude'] = this.businessLongitude;
    data['isPublished'] = this.isPublished;
    return data;
  }
}
