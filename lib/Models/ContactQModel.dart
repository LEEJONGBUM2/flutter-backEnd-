class ContactQ {
  String? q1;
  String? c1;
  String? q2;
  String? c2;
  String? q3;
  String? c3;
  String? q4;
  String? c4;

  ContactQ({
    this.q1,
    this.c1,
    this.q2,
    this.c2,
    this.q3,
    this.c3,
    this.q4,
    this.c4,
  });

  factory ContactQ.fromJson(Map<String, dynamic> json) {
    return ContactQ(
      q1: json['q1'],
      c1: json['c1'],
      q2: json['q2'],
      c2: json['c2'],
      q3: json['q3'],
      c3: json['c3'],
      q4: json['q4'],
      c4: json['c4'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q1'] = this.q1;
    data['c1'] = this.c1;
    data['q2'] = this.q2;
    data['c2'] = this.c2;
    data['q3'] = this.q3;
    data['c3'] = this.c3;
    data['q4'] = this.q4;
    data['c4'] = this.c4;

    return data;
  }
}
