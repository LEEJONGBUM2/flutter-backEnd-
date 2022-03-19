class Transactions {
  int? transactionId;
  int? amount;
  String? username;
  String? date;
  String? reason;
  String? vendor;

  Transactions(
      {this.transactionId,
      this.amount,
      this.username,
      this.date,
      this.reason,
      this.vendor});

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
    transactionId : json['transactionId'],
    amount : json['amount'],
    username : json['username'],
    date : json['date'],
    reason : json['reason'],
    vendor : json['vendor']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['amount'] = this.amount;
    data['username'] = this.username;
    data['date'] = this.date;
    data['reason'] = this.reason;
    data['vendor'] = this.vendor;
    return data;
  }
}
