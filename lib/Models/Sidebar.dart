class Sidebar {
  int? sidebarId;
  String? item1;
  String? item2;
  String? item3;
  String? item4;
  String? item5;
  String? item6;
  String? item7;
  String? item8;

  Sidebar(
      {this.sidebarId,
      this.item1,
      this.item2,
      this.item3,
      this.item4,
      this.item5,
      this.item6,
      this.item7,
      this.item8});

  factory Sidebar.fromJson(Map<String, dynamic> json) {
    return Sidebar(
    sidebarId : json['sidebarId'],
    item1 : json['item1'],
    item2 : json['item2'],
    item3 : json['item3'],
    item4 : json['item4'],
    item5 : json['item5'],
    item6 : json['item6'],
    item7 : json['item7'],
    item8 : json['item8'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sidebarId'] = this.sidebarId;
    data['item1'] = this.item1;
    data['item2'] = this.item2;
    data['item3'] = this.item3;
    data['item4'] = this.item4;
    data['item5'] = this.item5;
    data['item6'] = this.item6;
    data['item7'] = this.item7;
    data['item8'] = this.item8;
    return data;
  }
}
