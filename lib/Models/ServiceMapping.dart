// ignore_for_file: unnecessary_this, file_names

class ServiceMapping {
  int? mappingId;
  String? mapping;
  String? vendor;

  ServiceMapping({this.mappingId, this.mapping, this.vendor});

  factory ServiceMapping.fromJson(Map<String, dynamic> json) {
    return ServiceMapping(
    mappingId : json['mappingId'],
    mapping : json['mapping'],
    vendor : json['vendor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mappingId'] = this.mappingId;
    data['mapping'] = this.mapping;
    data['vendor'] = this.vendor;
    return data;
  }
}
