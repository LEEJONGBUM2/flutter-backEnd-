class BusinessCate {
  int? businessCateId;
  String? serviceCategory;
  String? businessCategory;
  String? typeOfBusiness;
  String? countryCategory;
  String? restaurantCategory;
  String? typeOfFood;

  BusinessCate(
      {this.businessCateId,
      this.serviceCategory,
      this.businessCategory,
      this.typeOfBusiness,
      this.countryCategory,
      this.restaurantCategory,
      this.typeOfFood});

  factory BusinessCate.fromJson(Map<String, dynamic> json) {
    return BusinessCate(
      businessCateId: json['businessCateId'],
      serviceCategory: json['service_category'],
      businessCategory: json['business_category'],
      typeOfBusiness: json['type_of_business'],
      countryCategory: json['country_category'],
      restaurantCategory: json['restaurant_category'],
      typeOfFood: json['type_of_food'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessCateId'] = this.businessCateId;
    data['service_category'] = this.serviceCategory;
    data['business_category'] = this.businessCategory;
    data['type_of_business'] = this.typeOfBusiness;
    data['country_category'] = this.countryCategory;
    data['restaurant_category'] = this.restaurantCategory;
    data['type_of_food'] = this.typeOfFood;
    return data;
  }
}
