// ignore_for_file: unnecessary_this, file_names

class UserIndividual {
  int? userId;
  String? fullName;
  String? emailAddress;
  String? password;
  String? contactNumber;

  UserIndividual(
      {this.userId,
      this.fullName,
      this.emailAddress,
      this.password,
      this.contactNumber});

  factory UserIndividual.fromJson(Map<String, dynamic> json) {
    return UserIndividual(
      userId: json['userId'],
      fullName: json['fullName'],
      emailAddress: json['emailAddress'],
      password: json['password'],
      contactNumber: json['contactNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['emailAddress'] = this.emailAddress;
    data['password'] = this.password;
    data['contactNumber'] = this.contactNumber;
    return data;
  }
}
