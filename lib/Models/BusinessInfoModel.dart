// class BusinessInfo {
//   int? businessInfoId;
//   String? vendorName;
//   int? registerOfCompanyNo;
//   String? email;
//   String? companyDescription;
//   int? introducerCode;
//   String? contactNumber;
//   int? verificationCode;
//   List<String>? restDay;
//   String? businessHours;

//   BusinessInfo(
//       {this.businessInfoId,
//       this.vendorName,
//       this.registerOfCompanyNo,
//       this.email,
//       this.companyDescription,
//       this.introducerCode,
//       this.contactNumber,
//       this.verificationCode,
//       this.restDay,
//       this.businessHours});

//   factory BusinessInfo.fromJson(Map<String, dynamic> json) {
//     return BusinessInfo(
//       businessInfoId: json['businessInfoId'],
//       vendorName: json['vendor_name'],
//       registerOfCompanyNo: json['register_of_company_no'],
//       email: json['email'],
//       companyDescription: json['company_description'],
//       introducerCode: json['introducer_code'],
//       contactNumber: json['contact_number'],
//       verificationCode: json['verification_code'],
//       restDay: json['rest_day'].cast<String>(),
//       businessHours: json['business_hours'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['businessInfoId'] = this.businessInfoId;
//     data['vendor_name'] = this.vendorName;
//     data['register_of_company_no'] = this.registerOfCompanyNo;
//     data['email'] = this.email;
//     data['company_description'] = this.companyDescription;
//     data['introducer_code'] = this.introducerCode;
//     data['contact_number'] = this.contactNumber;
//     data['verification_code'] = this.verificationCode;
//     data['rest_day'] = this.restDay;
//     data['business_hours'] = this.businessHours;
//     return data;
//   }
// }
