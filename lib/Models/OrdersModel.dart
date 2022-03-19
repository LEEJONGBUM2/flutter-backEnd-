class Orders {
  int? orderId;
  String? orderStatus;
  String? vendor;
  String? customer;
  String? startDate;
  String? endDate;
  String? orderTotal;

  Orders(
      {this.orderId,
      this.orderStatus,
      this.vendor,
      this.customer,
      this.startDate,
      this.endDate,
      this.orderTotal});

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
    orderId : json['orderId'],
    orderStatus : json['orderStatus'],
    vendor : json['vendor'],
    customer : json['customer'],
    startDate : json['startDate'],
    endDate : json['endDate'],
    orderTotal : json['orderTotal']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderStatus'] = this.orderStatus;
    data['vendor'] = this.vendor;
    data['customer'] = this.customer;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['orderTotal'] = this.orderTotal;
    return data;
  }
}
