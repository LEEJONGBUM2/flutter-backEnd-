class Navbar {
  int? navbarId;
  String? uItem1;
  String? uItem2;
  String? uItem3;
  String? uItem4;
  String? uItem5;
  String? uItem6;
  String? uItem7;

  Navbar({
    this.navbarId,
    this.uItem1,
    this.uItem2,
    this.uItem3,
    this.uItem4,
    this.uItem5,
    this.uItem6,
    this.uItem7,
  });

  factory Navbar.fromJson(Map<String, dynamic> json) {
    return Navbar(
      navbarId: json['navbarId'],
      uItem1: json['uItem1'],
      uItem2: json['uItem2'],
      uItem3: json['uItem3'],
      uItem4: json['uItem4'],
      uItem5: json['uItem5'],
      uItem6: json['uItem6'],
      uItem7: json['uItem7'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['navbarId'] = this.navbarId;
    data['uItem1'] = this.uItem1;
    data['uItem2'] = this.uItem2;
    data['uItem3'] = this.uItem3;
    data['uItem4'] = this.uItem4;
    data['uItem5'] = this.uItem5;
    data['uItem6'] = this.uItem6;
    data['uItem7'] = this.uItem7;

    return data;
  }
}
