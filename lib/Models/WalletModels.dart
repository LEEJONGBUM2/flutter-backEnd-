class Wallet {
  int? walletId;
  int? amount;
  String? username;
  String? date;
  String? virtualCardNumber;
  String? reason;
  String? vendor;

  Wallet(
      {this.walletId,
      this.amount,
      this.username,
      this.date,
      this.virtualCardNumber,
      this.reason,
      this.vendor});

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
    walletId : json['walletId'],
    amount : json['amount'],
    username : json['username'],
    date : json['date'],
    virtualCardNumber : json['virtualCardNumber'],
    reason : json['reason'],
    vendor : json['vendor']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['walletId'] = this.walletId;
    data['amount'] = this.amount;
    data['username'] = this.username;
    data['date'] = this.date;
    data['virtualCardNumber'] = this.virtualCardNumber;
    data['reason'] = this.reason;
    data['vendor'] = this.vendor;
    return data;
  }
}
