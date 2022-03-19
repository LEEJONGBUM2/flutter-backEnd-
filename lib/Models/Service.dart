// ignore_for_file: unnecessary_this, file_names

class Service {
  int? serviceId;
  String? serviceName;
  String? serviceDescription;
  String? ssu;
  String? servicePrice;
  int? stock;
  String? serviceSpecialPrice;
  String? specialPriceStart;
  String? specialPriceEnd;
  String? taxType;
  String? isPublished;
  String? vendor;

  Service(
      {this.serviceId,
      this.serviceName,
      this.serviceDescription,
      this.ssu,
      this.servicePrice,
      this.stock,
      this.serviceSpecialPrice,
      this.specialPriceStart,
      this.specialPriceEnd,
      this.taxType,
      this.isPublished,
      this.vendor});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
    serviceId : json['serviceId'],
    serviceName : json['serviceName'],
    serviceDescription : json['serviceDescription'],
    ssu : json['ssu'],
    servicePrice : json['servicePrice'],
    stock : json['stock'],
    serviceSpecialPrice : json['serviceSpecialPrice'],
    specialPriceStart : json['specialPriceStart'],
    specialPriceEnd : json['specialPriceEnd'],
    taxType : json['taxType'],
    isPublished : json['isPublished'],
    vendor : json['vendor']  
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['serviceName'] = this.serviceName;
    data['serviceDescription'] = this.serviceDescription;
    data['ssu'] = this.ssu;
    data['servicePrice'] = this.servicePrice;
    data['stock'] = this.stock;
    data['serviceSpecialPrice'] = this.serviceSpecialPrice;
    data['specialPriceStart'] = this.specialPriceStart;
    data['specialPriceEnd'] = this.specialPriceEnd;
    data['taxType'] = this.taxType;
    data['isPublished'] = this.isPublished;
    data['vendor'] = this.vendor;
    return data;
  }
}
