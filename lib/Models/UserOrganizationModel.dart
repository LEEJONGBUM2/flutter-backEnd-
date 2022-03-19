// ignore_for_file: unnecessary_this, file_names

class UserOrganization {
  int? userId;
  String? companyName;
  int? companyRocNumber;
  String? address;
  String? country;
  String? state;
  String? city;
  int? postalCode;
  String? emailAddress;
  String? password;
  String? contactNumber;

  UserOrganization(
      {this.userId,
      this.companyName,
      this.companyRocNumber,
      this.address,
      this.country,
      this.state,
      this.city,
      this.postalCode,
      this.emailAddress,
      this.password,
      this.contactNumber});

  factory UserOrganization.fromJson(Map<String, dynamic> json) {
    return UserOrganization(
      userId: json['userId'],
      companyName: json['companyName'],
      companyRocNumber: json['companyRocNumber'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      postalCode: json['postalCode'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      contactNumber: json['contactNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['companyName'] = this.companyName;
    data['companyRocNumber'] = this.companyRocNumber;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['emailAddress'] = this.emailAddress;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    return data;
  }
}
