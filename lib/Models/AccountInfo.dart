class AccountInfo {
  int? accountInfoId;
  String? personInChargeName;
  String? phoneNumber;
  String? vendorEmail;
  // String? selectedBusinessCate;
  String? isPublished;

  AccountInfo({
    this.accountInfoId,
    this.personInChargeName,
    this.phoneNumber,
    this.vendorEmail,
    // this.selectedBusinessCate,
    this.isPublished,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
      accountInfoId: json['accountInfoId'],
      personInChargeName: json['personInChargeName'],
      phoneNumber: json['phoneNumber'],
      vendorEmail: json['vendorEmail'],
      //  selectedBusinessCate: json['selectedBusinessCate'],
      isPublished: json['isPublished'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountInfoId'] = this.accountInfoId;
    data['personInChargeName'] = this.personInChargeName;
    data['phoneNumber'] = this.phoneNumber;
    data['vendorEmail'] = this.vendorEmail;
    //  data['selectedBusinessCate'] = this.selectedBusinessCate;
    data['isPublished'] = this.isPublished;
    return data;
  }
}
