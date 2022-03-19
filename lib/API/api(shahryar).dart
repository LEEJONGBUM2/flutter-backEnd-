// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:iconnexz/Models/AddressModel.dart';
// import 'package:iconnexz/Models/BankInfoModel.dart';
// import 'package:iconnexz/Models/BusinessCateModel.dart';
// import 'package:iconnexz/Models/BusinessInfoModel.dart';
// import 'package:iconnexz/Models/BusinessTypeModel.dart';
// import 'package:iconnexz/Models/ContactModel.dart';
// import 'package:iconnexz/Models/FaqModel.dart';
// import 'package:iconnexz/Models/Image.dart';
// import 'package:iconnexz/Models/Sidebar.dart';
// import 'package:iconnexz/Models/SuggestModel.dart';
// import 'package:iconnexz/Models/UserIndividualModel.dart';
// import 'package:iconnexz/Models/UserOrganizationModel.dart';
// import 'package:iconnexz/Models/VendorInfoModel.dart';

// import '../main.dart';

// Future<UserIndividual> createUserIndividual(String fullName,
//     String emailAddress, String password, String contactNumber) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/UserIndividualModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'fullName': fullName,
//       'emailAddress': emailAddress,
//       'password': password,
//       'contactNumber': contactNumber
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return UserIndividual.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create user.');
//   }
// }

// Future<List<Sidebar>> fetchSidebar() async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http
//       .get(Uri.parse('https://192.168.1.106:45455/api/VendorSidebarModels'));
//   List<Sidebar> sidebar = [];

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var sidebarJson = json.decode(response.body);
//     for (var sidebarJson in sidebarJson) {
//       sidebar.add(Sidebar.fromJson(sidebarJson));
//     }
//     return sidebar;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Sidebar');
//   }
// }

// Future<List<Image1>> fetchImage() async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response =
//       await http.get(Uri.parse('https://192.168.1.106:45455/api/ImageModels'));
//   List<Image1> image = [];

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     var imageJson = json.decode(response.body);
//     for (var imageJson in imageJson) {
//       image.add(Image1.fromJson(imageJson));
//     }
//     return image;
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Image');
//   }
// }

// Future<UserOrganization> createUserOrganization(
//     String companyName,
//     int companyRocNumber,
//     String address,
//     String country,
//     String state,
//     String city,
//     int postalCode,
//     String emailAddress,
//     String password,
//     String contactNumber) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/UserOrganizationModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'companyName': companyName,
//       'companyRocNumber': companyRocNumber.toString(),
//       'address': address,
//       'country': country,
//       'state': state,
//       'city': city,
//       'postalCode': postalCode.toString(),
//       'emailAddress': emailAddress,
//       'password': password,
//       'contactNumber': contactNumber,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return UserOrganization.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create user.');
//   }
// }

// Future<Address> createAddress(
//   String address,
//   // String country,
//   // String state,
//   // String city,
//   int postcode,
//   String shopLatitude,
//   String shopLongitude,
//   String flatRate,
//   String forFirst,
//   String everyAdditional,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/AddressModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'address': address,
//       // 'country': country,
//       // 'state': state,
//       // 'city': city,
//       'postcode': postcode.toString(),
//       'shopLatitude': shopLatitude,
//       'shopLongitude': shopLongitude,
//       'flatRate': flatRate,
//       'forFirst': forFirst,
//       'everyAdditional': everyAdditional,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Address.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<BankInfo> createBankInfo(
//   // String bankName,
//   int bankAccountNo,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/BankInfoModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       // 'bankName': bankName,
//       'bankAccountNo': bankAccountNo.toString(),
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return BankInfo.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<BusinessCate> createBusinessCate(
//   String serviceCategory,
//   String businessCategory,
//   String typeOfBusiness,
//   String countryCategory,
//   String restaurantCategory,
//   String typeOfFood,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/BusinessCateModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'serviceCategory': serviceCategory,
//       'businessCategory': businessCategory,
//       'typeOfBusiness': typeOfBusiness,
//       'countryCategory': countryCategory,
//       'restaurantCategory': restaurantCategory,
//       'typeOfFood': typeOfFood,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return BusinessCate.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<BusinessInfo> createBusinessInfo(
//   String vendorName,
//   int registerOfCompanyNo,
//   String email,
//   String companyDescription,
//   int introducerCode,
//   String contactNumber,
//   int verificationCode,
//   // List<String> restDay,
//   // String businessHours,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/BusinessInfoModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'vendorName': vendorName,
//       'registerOfCompanyNo': registerOfCompanyNo.toString(),
//       'email': email,
//       'companyDescription': companyDescription,
//       'introducerCode': introducerCode.toString(),
//       'contactNumber': contactNumber,
//       'verificationCode': verificationCode.toString(),
//       // 'restDay': restDay.toString(),
//       // 'businessHours': businessHours,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return BusinessInfo.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<BusinessType> createVendorReg(
//   // String businessType,
//   String vendorName,
//   int registerOfCompanyNo,
//   String email,
//   String companyDescription,
//   int introducerCode,
//   String contactNumber,
//   int verificationCode,
//   // List<String> restDay,
//   // String businessHours,
//   String personInChargeName,
//   String emailAddress,
//   String password,
//   String confirmPassword,
//   String contactNumber2,
//   int verificationCode2,
//   // String serviceCategory,
//   // String businessCategory,
//   // String typeOfBusiness,
//   // String countryCategory,
//   // String restaurantCategory,
//   // String typeOfFood,
//   String address,
//   // String country,
//   // String state,
//   // String city,
//   int postcode,
//   String shopLatitude,
//   String shopLongitude,
//   String flatRate,
//   String forFirst,
//   String everyAdditional,
//   // String bankName,
//   int bankAccountNo,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/VendorRegModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       //'businessType': businessType,//
//       'vendorName': vendorName,
//       'registerOfCompanyNo': registerOfCompanyNo.toString(),
//       'email': email,
//       'companyDescription': companyDescription,
//       'introducerCode': introducerCode.toString(),
//       'contactNumber': contactNumber,
//       'verificationCode': verificationCode.toString(),
//       //'restDay': restDay.toString(),//
//       //'businessHours': businessHours,//
//       'personInChargeName': personInChargeName,
//       'emailAddress': emailAddress,
//       'password': password,
//       'confirmPassword': confirmPassword,
//       'contactNumber2': contactNumber2,
//       'verificationCode2': verificationCode2.toString(),
//       //'serviceCategory': serviceCategory,//
//       // 'businessCategory': businessCategory,//
//       //'typeOfBusiness': typeOfBusiness,//
//       //'countryCategory': countryCategory,//
//       //'restaurantCategory': restaurantCategory,//
//       //'typeOfFood': typeOfFood,//
//       'address': address,
//       // 'country': country,//
//       // 'state': state,//
//       // 'city': city,//
//       'postcode': postcode.toString(),
//       'shopLatitude': shopLatitude,
//       'shopLongitude': shopLongitude,
//       'flatRate': flatRate,
//       'forFirst': forFirst,
//       'everyAdditional': everyAdditional,
//       //'bankName': bankName, //
//       'bankAccountNo': bankAccountNo.toString(),
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return BusinessType.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<VendorInfo> createVendorInfo(
//   String personInChargeName,
//   String emailAddress,
//   String password,
//   String confirmPassword,
//   String contactNumber,
//   int verificationCode,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/BusinessCateModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'personInChargeName': personInChargeName,
//       'emailAddress': emailAddress,
//       'password': password,
//       'confirmPassword': confirmPassword,
//       'contactNumber': contactNumber,
//       'verificationCode': verificationCode.toString(),
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return VendorInfo.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create vendor.');
//   }
// }

// Future<Suggest> createSuggest(
//   String vendorName,
//   String ownerName,
//   int hpNumber,
//   int telNumber,
//   String emailAddress,
//   String street,
//   int postalCode,
//   String city,
//   String state,
//   String country,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/SuggestModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'vendorName': vendorName,
//       'ownerName': ownerName,
//       'hpNumber': hpNumber.toString(),
//       'telNumber': telNumber.toString(),
//       'emailAddress': emailAddress,
//       'street': street,
//       'postalCode': postalCode.toString(),
//       'city ': city,
//       'state': state,
//       'country': country,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Suggest.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create user.');
//   }
// }

// Future<Contact> createContact(
//   String q1,
//   String q2,
//   String q3,
//   String q4,
//   String selectDepartment,
//   String name,
//   String email,
//   String subject,
//   int contactNumber,
//   String message,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/ContactModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'q1': q1,
//       'q2': q2,
//       'q3': q3,
//       'q4': q4,
//       'selectDepartment': selectDepartment,
//       'name': name,
//       'email': email,
//       'subject': subject,
//       'contactNumber': contactNumber.toString(),
//       'message': message,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Contact.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create user.');
//   }
// }

// Future<Faq> createFaq(
//   String question1,
//   String question2,
//   String question3,
//   String question4,
//   String question5,
//   String question6,
// ) async {
//   HttpOverrides.global = new MyHttpOverrides();
//   final response = await http.post(
//     Uri.parse('https://192.168.1.106:45455/api/FaqModels'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'question1': question1,
//       'question2': question2,
//       'question3': question3,
//       'question4': question4,
//       'question5': question5,
//       'question6': question6,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Faq.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create user.');
//   }
// }
