class VendorInfo {
  int? vendorInfoId;
  String? personInChargeName;
  String? emailAddress;
  String? password;
  String? confirmPassword;
  String? contactNumber;
  int? verificationCode;

  VendorInfo(
      {this.vendorInfoId,
      this.personInChargeName,
      this.emailAddress,
      this.password,
      this.confirmPassword,
      this.contactNumber,
      this.verificationCode});

  factory VendorInfo.fromJson(Map<String, dynamic> json) {
    return VendorInfo(
      vendorInfoId: json['vendorInfoId'],
      personInChargeName: json['person_in_charge_name'],
      emailAddress: json['email_address'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
      contactNumber: json['contact_number'],
      verificationCode: json['verification_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vendorInfoId'] = this.vendorInfoId;
    data['person_in_charge_name'] = this.personInChargeName;
    data['email_address'] = this.emailAddress;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['contact_number'] = this.contactNumber;
    data['verification_code'] = this.verificationCode;
    return data;
  }
}
