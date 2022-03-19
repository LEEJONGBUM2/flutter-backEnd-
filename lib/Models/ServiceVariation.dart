// ignore_for_file: unnecessary_this, file_names

class ServiceVariation {
  int? variationsId;
  String? variationName;
  String? vendor;
  String? control;

  ServiceVariation(
      {this.variationsId, this.variationName, this.vendor, this.control});

  factory ServiceVariation.fromJson(Map<String, dynamic> json) {
    return ServiceVariation(
    variationsId : json['variationsId'],
    variationName : json['variationName'],
    vendor : json['vendor'],
    control : json['control']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variationsId'] = this.variationsId;
    data['variationName'] = this.variationName;
    data['vendor'] = this.vendor;
    data['control'] = this.control;
    return data;
  }
}
