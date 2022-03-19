class Image1 {
  int? imageId;
  String? title;
  String? image;
  String? imageFilePath;

  Image1({this.imageId, this.title, this.image, this.imageFilePath});

  factory Image1.fromJson(Map<String, dynamic> json) {
    return Image1(
    imageId : json['imageId'],
    title : json['title'],
    image : json['image'],
    imageFilePath : json['imageFilePath'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageId'] = this.imageId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['imageFilePath'] = this.imageFilePath;
    return data;
  }
}
