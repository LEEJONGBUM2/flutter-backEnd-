class Sample {
  int? sampleId;
  String? sampleName;

  Sample({this.sampleId, this.sampleName});

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
    sampleId : json['sampleId'],
    sampleName : json['sampleName']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sampleId'] = this.sampleId;
    data['sampleName'] = this.sampleName;
    return data;
  }
}
