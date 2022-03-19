class Campaign {
  int? campaignId;
  String? campaignName;
  String? startDate;
  String? endDate;
  String? vendor;


  Campaign({this.campaignId, this.campaignName, this.startDate, this.endDate, this.vendor});

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
    campaignId : json['campaignId'],
    campaignName : json['campaignName'],
    startDate : json['startDate'],
    endDate : json['endDate'],
    vendor : json['vendor']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaignId'] = this.campaignId;
    data['campaignName'] = this.campaignName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['vendor'] = this.vendor;
    return data;
  }
}
