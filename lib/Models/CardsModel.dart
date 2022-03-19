class Cards {
  int? cardId;
  String? vendor;
  String? virtualCardNumber;
  String? expiry;
  String? cvv;
  String? cardType;

  Cards(
      {this.cardId,
      this.vendor,
      this.virtualCardNumber,
      this.expiry,
      this.cvv,
      this.cardType});

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
    cardId : json['cardId'],
    vendor : json['vendor'],
    virtualCardNumber : json['virtualCardNumber'],
    expiry : json['expiry'],
    cvv : json['cvv'],
    cardType : json['cardType']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardId'] = this.cardId;
    data['vendor'] = this.vendor;
    data['virtualCardNumber'] = this.virtualCardNumber;
    data['expiry'] = this.expiry;
    data['cvv'] = this.cvv;
    data['cardType'] = this.cardType;
    return data;
  }
}
