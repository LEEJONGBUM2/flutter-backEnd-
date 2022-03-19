class VendorReg {
  int? vendorRegId;
  String? businessType;
  String? vendorName;
  int? registerOfCompanyNo;
  String? email;
  String? companyDescription;
  int? introducerCode;
  String? contactNumber;
  int? verificationCode;
  String? mondayCheck;
  String? tuesdayCheck;
  String? wednesdayCheck;
  String? thursdayCheck;
  String? fridayCheck;
  String? saturdayCheck;
  String? sundayCheck;
  String? startBusinessHours;
  String? endBusinessHours;
  String? personInChargeName;
  String? emailAddress;
  String? password;
  String? confirmPassword;
  String? contactNumber2;
  int? verificationCode2;
  String? serviceCategory;
  String? businessCategory;
  String? typeOfBusiness;
  String? countryCategory;
  String? restaurantCategory;
  String? typeOfFood;
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
  String? bankName;
  int? bankAccountNo;

  VendorReg(
      {this.vendorRegId,
      this.businessType,
      this.vendorName,
      this.registerOfCompanyNo,
      this.email,
      this.companyDescription,
      this.introducerCode,
      this.contactNumber,
      this.verificationCode,
      this.mondayCheck,
      this.tuesdayCheck,
      this.wednesdayCheck,
      this.thursdayCheck,
      this.fridayCheck,
      this.saturdayCheck,
      this.sundayCheck,
      this.startBusinessHours,
      this.endBusinessHours,
      this.personInChargeName,
      this.emailAddress,
      this.password,
      this.confirmPassword,
      this.contactNumber2,
      this.verificationCode2,
      this.serviceCategory,
      this.businessCategory,
      this.typeOfBusiness,
      this.countryCategory,
      this.restaurantCategory,
      this.typeOfFood,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postcode,
      this.shopLatitude,
      this.shopLongitude,
      this.flatRate,
      this.forFirst,
      this.everyAdditional,
      this.bankName,
      this.bankAccountNo});

  factory VendorReg.fromJson(Map<String, dynamic> json) {
    return VendorReg(
      vendorRegId: json['vendorRegId'],
      businessType: json['business_type'],
      vendorName: json['vendor_name'],
      registerOfCompanyNo: json['register_of_company_no'],
      email: json['email'],
      companyDescription: json['company_description'],
      introducerCode: json['introducer_code'],
      contactNumber: json['contact_number'],
      verificationCode: json['verification_code'],
      mondayCheck: json['monday_check'],
      tuesdayCheck: json['tuesday_check'],
      wednesdayCheck: json['wednesday_check'],
      thursdayCheck: json['thursday_check'],
      fridayCheck: json['friday_check'],
      saturdayCheck: json['saturday_check'],
      sundayCheck: json['sunday_check'],
      startBusinessHours: json['start_business_hours'],
      endBusinessHours: json['end_business_hours'],
      personInChargeName: json['person_in_charge_name'],
      emailAddress: json['email_address'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
      contactNumber2: json['contact_number2'],
      verificationCode2: json['verification_code2'],
      serviceCategory: json['service_category'],
      businessCategory: json['business_category'],
      typeOfBusiness: json['type_of_business'],
      countryCategory: json['country_category'],
      restaurantCategory: json['restaurant_category'],
      typeOfFood: json['type_of_food'],
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
      bankName: json['bank_name'],
      bankAccountNo: json['bank_account_no'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorRegId'] = this.vendorRegId;
    data['business_type'] = this.businessType;
    data['vendor_name'] = this.vendorName;
    data['register_of_company_no'] = this.registerOfCompanyNo;
    data['email'] = this.email;
    data['company_description'] = this.companyDescription;
    data['introducer_code'] = this.introducerCode;
    data['contact_number'] = this.contactNumber;
    data['verification_code'] = this.verificationCode;
    data['monday_check'] = this.mondayCheck;
    data['tuesday_check'] = this.tuesdayCheck;
    data['wednesday_check'] = this.wednesdayCheck;
    data['thursday_check'] = this.thursdayCheck;
    data['friday_check'] = this.fridayCheck;
    data['saturday_check'] = this.saturdayCheck;
    data['sunday_check'] = this.sundayCheck;
    data['start_business_hours'] = this.startBusinessHours;
    data['end_business_hours'] = this.endBusinessHours;
    data['person_in_charge_name'] = this.personInChargeName;
    data['email_address'] = this.emailAddress;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['contact_number2'] = this.contactNumber2;
    data['verification_code2'] = this.verificationCode2;
    data['service_category'] = this.serviceCategory;
    data['business_category'] = this.businessCategory;
    data['type_of_business'] = this.typeOfBusiness;
    data['country_category'] = this.countryCategory;
    data['restaurant_category'] = this.restaurantCategory;
    data['type_of_food'] = this.typeOfFood;
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
    data['bank_name'] = this.bankName;
    data['bank_account_no'] = this.bankAccountNo;
    return data;
  }
}
