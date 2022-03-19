class BusinessInfo {
  int? businessInfoId;
  String? contactNumber;
  String? companyDescription;
  String? businessStartTime;
  String? businessFinishTime;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;
  String? isPublished;
  String? personInChargeName;
  String? phoneNumber;
  String? vendorEmail;
  String? isPublished2;
  String? vendorAddress;
  String? country;
  String? state;
  String? city;
  String? postCode;
  String? businessLatitude;
  String? businessLongitude;
  String? isPublished3;
  String? bankName;
  String? accountNumber;
  String? isPublished4;

  BusinessInfo({
    this.businessInfoId,
    this.contactNumber,
    this.companyDescription,
    this.businessStartTime,
    this.businessFinishTime,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.isPublished,
    this.personInChargeName,
    this.phoneNumber,
    this.vendorEmail,
    this.isPublished2,
    this.vendorAddress,
    this.country,
    this.state,
    this.city,
    this.postCode,
    this.businessLatitude,
    this.businessLongitude,
    this.isPublished3,
    this.bankName,
    this.accountNumber,
    this.isPublished4,
  });

  factory BusinessInfo.fromJson(Map<String, dynamic> json) {
    return BusinessInfo(
      businessInfoId: json['businessInfoId'],
      contactNumber: json['contactNumber'],
      companyDescription: json['companyDescription'],
      businessStartTime: json['businessStartTime'],
      businessFinishTime: json['businessFinishTime'],
      monday: json['monday'],
      tuesday: json['tuesday'],
      wednesday: json['wednesday'],
      thursday: json['thursday'],
      friday: json['friday'],
      saturday: json['saturday'],
      sunday: json['sunday'],
      isPublished: json['isPublished'],
      personInChargeName: json['personInChargeName'],
      phoneNumber: json['phoneNumber'],
      vendorEmail: json['vendorEmail'],
      isPublished2: json['isPublished2'],
      vendorAddress: json['vendorAddress'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postCode: json['postCode'],
      businessLatitude: json['businessLatitude'],
      businessLongitude: json['businessLongitude'],
      isPublished3: json['isPublished3'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      isPublished4: json['isPublished4'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessInfoId'] = this.businessInfoId;
    data['contactNumber'] = this.contactNumber;
    data['companyDescription'] = this.companyDescription;
    data['businessStartTime'] = this.businessStartTime;
    data['businessFinishTime'] = this.businessFinishTime;
    data['monday'] = this.monday;
    data['tuesday'] = this.tuesday;
    data['wednesday'] = this.wednesday;
    data['thursday'] = this.thursday;
    data['friday'] = this.friday;
    data['saturday'] = this.saturday;
    data['sunday'] = this.sunday;
    data['isPublished'] = this.isPublished;
    data['personInChargeName'] = this.personInChargeName;
    data['phoneNumber'] = this.phoneNumber;
    data['vendorEmail'] = this.vendorEmail;
    data['isPublished2'] = this.isPublished2;
    data['vendorAddress'] = this.vendorAddress;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postCode'] = this.postCode;
    data['businessLatitude'] = this.businessLatitude;
    data['businessLongitude'] = this.businessLongitude;
    data['isPublished3'] = this.isPublished3;
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['isPublished4'] = this.isPublished4;
    return data;
  }
}
