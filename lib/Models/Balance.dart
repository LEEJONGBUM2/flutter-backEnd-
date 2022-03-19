class Balance {
  int? balanceId;
  int? balance;
  String? vendor;

  Balance({this.balanceId, this.balance, this.vendor});

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
    balanceId : json['balanceId'],
    balance : json['balance'],
    vendor : json['vendor']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balanceId'] = this.balanceId;
    data['balance'] = this.balance;
    data['vendor'] = this.vendor;
    return data;
  }
}
