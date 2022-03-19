class BankInformation {
  int? bankInformationId;
  String? bankName;
  String? accountNumber;
  String? isPublished;

  BankInformation({
    this.bankInformationId,
    this.bankName,
    this.accountNumber,
    this.isPublished,
  });

  factory BankInformation.fromJson(Map<String, dynamic> json) {
    return BankInformation(
      bankInformationId: json['bankInformationId'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      isPublished: json['isPublished'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankInformationId'] = this.bankInformationId;
    data['bankName'] = this.bankName;
    data['accountNumber'] = this.accountNumber;
    data['isPublished'] = this.isPublished;
    return data;
  }
}
