class Contact {
  // String? q1;
  // String? q2;
  // String? q3;
  // String? q4;
  String? selectDepartment;
  String? name;
  String? email;
  String? subject;
  int? contactNumber;
  String? message;

  Contact(
      {
      //   this.q1,
      // this.q2,
      // this.q3,
      // this.q4,
      this.selectDepartment,
      this.name,
      this.email,
      this.subject,
      this.contactNumber,
      this.message});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      // q1: json['q1'],
      // q2: json['q2'],
      // q3: json['q3'],
      // q4: json['q4'],
      selectDepartment: json['selectDepartment'],
      name: json['name'],
      email: json['email'],
      subject: json['subject'],
      contactNumber: json['contactNumber'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['q1'] = this.q1;
    // data['q2'] = this.q2;
    // data['q3'] = this.q3;
    // data['q4'] = this.q4;
    data['selectDepartment'] = this.selectDepartment;
    data['name'] = this.name;
    data['email'] = this.email;
    data['subject'] = this.subject;
    data['contactNumber'] = this.contactNumber;
    data['message'] = this.message;
    return data;
  }
}
