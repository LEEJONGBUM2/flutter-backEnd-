class Faq {
  int? faqId;
  String? question1;
  String? content1;
  String? question2;
  String? content2;
  String? question3;
  String? content3;
  String? question4;
  String? content4;
  String? question5;
  String? content5;
  String? question6;
  String? content6;

  Faq(
      {this.faqId,
      this.question1,
      this.content1,
      this.question2,
      this.content2,
      this.question3,
      this.content3,
      this.question4,
      this.content4,
      this.question5,
      this.content5,
      this.question6,
      this.content6});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      faqId: json['faqId'],
      question1: json['question1'],
      content1: json['content1'],
      question2: json['question2'],
      content2: json['content2'],
      question3: json['question3'],
      content3: json['content3'],
      question4: json['question4'],
      content4: json['content4'],
      question5: json['question5'],
      content5: json['content5'],
      question6: json['question6'],
      content6: json['content6'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faqId'] = this.faqId;
    data['question1'] = this.question1;
    data['content1'] = this.content1;
    data['question2'] = this.question2;
    data['content2'] = this.content2;
    data['question3'] = this.question3;
    data['content3'] = this.content3;
    data['question4'] = this.question4;
    data['content4'] = this.content4;
    data['question5'] = this.question5;
    data['content5'] = this.content5;
    data['question6'] = this.question6;
    data['content6'] = this.content6;

    return data;
  }
}
