class Suggest {
  String? vendorName;
  String? ownerName;
  int? hpNumber;
  int? telNumber;
  String? emailAddress;
  String? street;
  int? postalCode;
  String? city;
  String? state;
  String? country;

  Suggest(
      {this.vendorName,
      this.ownerName,
      this.hpNumber,
      this.telNumber,
      this.emailAddress,
      this.street,
      this.postalCode,
      this.city,
      this.state,
      this.country});

  factory Suggest.fromJson(Map<String, dynamic> json) {
    return Suggest(
      vendorName: json['vendorName'],
      ownerName: json['ownerName'],
      hpNumber: json['hpNumber'],
      telNumber: json['telNumber'],
      emailAddress: json['emailAddress'],
      street: json['street'],
      postalCode: json['postalCode'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorName'] = this.vendorName;
    data['ownerName'] = this.ownerName;
    data['hpNumber'] = this.hpNumber;
    data['telNumber'] = this.telNumber;
    data['emailAddress'] = this.emailAddress;
    data['street'] = this.street;
    data['postalCode'] = this.postalCode;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    return data;
  }
}
