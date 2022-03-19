class BusinessType {
  int? businessTypeId;
  String? businessType;

  BusinessType({this.businessTypeId, this.businessType});

  factory BusinessType.fromJson(Map<String, dynamic> json) {
    return BusinessType(
      businessTypeId: json['businessTypeId'],
      businessType: json['business_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessTypeId'] = this.businessTypeId;
    data['business_type'] = this.businessType;
    return data;
  }
}
