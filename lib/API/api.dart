import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:iconnexz/Models/AccountInfo.dart';
import 'package:iconnexz/Models/AddressModel.dart';
import 'package:iconnexz/Models/Balance.dart';
import 'package:iconnexz/Models/BankInfoModel.dart';
import 'package:iconnexz/Models/BankInformation.dart';
import 'package:iconnexz/Models/BusinessCateModel.dart';
import 'package:iconnexz/Models/BusinessInfo.dart';
import 'package:iconnexz/Models/BusinessInfoModel.dart';
import 'package:iconnexz/Models/BusinessTypeModel.dart';
import 'package:iconnexz/Models/CampaignModel.dart';
import 'package:iconnexz/Models/CardsModel.dart';
import 'package:iconnexz/Models/ContactModel.dart';
import 'package:iconnexz/Models/ContactQModel.dart';
import 'package:iconnexz/Models/FaqModel.dart';
import 'package:iconnexz/Models/Image.dart';
import 'package:iconnexz/Models/Navbar.dart';
import 'package:iconnexz/Models/OrdersModel.dart';
import 'package:iconnexz/Models/Sample.dart';
import 'package:iconnexz/Models/Service.dart';
import 'package:iconnexz/Models/ServiceMapping.dart';
import 'package:iconnexz/Models/ServiceVariation.dart';
import 'package:iconnexz/Models/Sidebar.dart';
import 'package:iconnexz/Models/SuggestModel.dart';
import 'package:iconnexz/Models/Transactions.dart';
import 'package:iconnexz/Models/UserIndividualModel.dart';
import 'package:iconnexz/Models/UserOrganizationModel.dart';
import 'package:iconnexz/Models/VendorAddress.dart';
import 'package:iconnexz/Models/VendorRegModel.dart';
import 'package:iconnexz/Models/WalletModels.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

Future<Sample> createSample(String sampleName) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/SampleModels'),
    // Uri.parse('https://192.168.1.106:45455/api/SampleModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'sampleName': sampleName}),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Sample.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create sample.');
  }
}

Future<UserIndividual> createUserIndividual(String fullName,
    String emailAddress, String password, String contactNumber) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/Authenticate/UserIndividual'),
    //Uri.parse('https://192.168.1.106:45455/api/Authenticate/UserIndividual'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullName': fullName,
      'emailAddress': emailAddress,
      'password': password,
      'contactNumber': contactNumber
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserIndividual.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<UserIndividual> createUserIndividual2(String fullName,
    String emailAddress, String password, String contactNumber) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/UserIndividualModels'),
    //Uri.parse('https://192.168.1.106:45455/api/UserIndividualModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullName': fullName,
      'emailAddress': emailAddress,
      'password': password,
      'contactNumber': contactNumber
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserIndividual.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<ServiceMapping> createServiceMapping(
    String mapping, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/ServiceMappingModels'),
    //Uri.parse('https://192.168.1.106:45455/api/ServiceMappingModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'mapping': mapping, 'vendor': vendor}),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ServiceMapping.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Service Mapping.');
  }
}

Future<Campaign> createCampaign(String campaignName, String startDate,
    String endDate, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/CampaignModels'),
    // Uri.parse('https://192.168.1.106:45455/api/CampaignModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'campaignName': campaignName,
      'startDate': startDate,
      'endDate': endDate,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Campaign.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Campaign.');
  }
}

Future<int> signIn(String email, String password) async {
  try {
    // var deviceId = await getDeviceData();
    final data = jsonEncode({"email": email, "password": password});

    final response = await http.post(
      Uri.parse('https://172.30.1.10:45455/api/Authenticate/login'),
      // Uri.parse('https://192.168.1.106:45455/api/Authenticate/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: data,
    );
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      sharedPreferences.clear();
      sharedPreferences.setString("Bearer token", jsonResponse['token']);
      sharedPreferences.setInt("UserType", jsonResponse['type']);
      sharedPreferences.setString("UserName", jsonResponse['name']);
      print(jsonResponse);
      return 200;
    } else {
      print(jsonResponse);
      return 422;
    }
  } catch (e) {
    print(e);
    return 502;
  }
}

Future<Wallet> createWallet(int amount, String username, String date,
    String virtualCardNumber, String reason, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/WalletModels'),
    // Uri.parse('https://192.168.1.106:45455/api/WalletModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'amount': amount.toString(),
      'username': username,
      'date': date,
      'virtualCardNumber': virtualCardNumber,
      'reason': reason,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Wallet.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Wallet.');
  }
}

Future<Transactions> createTransaction(int amount, String username, String date,
    String reason, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/TransactionsModels'),
    // Uri.parse('https://192.168.1.106:45455/api/TransactionsModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'amount': amount.toString(),
      'username': username,
      'date': date,
      'reason': reason,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Transactions.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Transaction.');
  }
}

Future<ServiceMapping> updateServiceMapping(
    int? mappingId, String mapping, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse('https://172.30.1.10:45455/api/ServiceMappingModels/$mappingId'),
    // Uri.parse(
    //   'https://192.168.1.106:45455/api/ServiceMappingModels/$mappingId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'mappingId': mappingId.toString(),
      'mapping': mapping,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ServiceMapping.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Service Mapping.');
  }
}

Future<ServiceVariation> createServiceVariation(
    String variationName, String vendor, String control) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/ServiceVariationsModels'),
    //  Uri.parse('https://192.168.1.106:45455/api/ServiceVariationsModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'variationName': variationName,
      'vendor': vendor,
      'control': control
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ServiceVariation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Service Variation.');
  }
}

Future<ServiceVariation> updateServiceVariation(int? variationsId,
    String variationName, String vendor, String control) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse(
        'https://172.30.1.10:45455/api/ServiceVariationsModels/$variationsId'),
    //Uri.parse(
    //   'https://192.168.1.106:45455/api/ServiceVariationsModels/$variationsId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'variationsId': variationsId.toString(),
      'variationName': variationName,
      'vendor': vendor,
      'control': control
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return ServiceVariation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Service Variation.');
  }
}

Future<Orders> createOrders(
    //int? orderId,
    String orderStatus,
    String vendor,
    String customer,
    String startDate,
    String endDate,
    String orderTotal) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/OrdersModels'),
    //Uri.parse('https://192.168.1.106:45455/api/OrdersModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'orderStatus': orderStatus,
      'vendor': vendor,
      'customer': customer,
      'startDate': startDate,
      'endDate': endDate,
      'orderTotal': orderTotal
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Orders.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update Order.');
  }
}

Future<Orders> updateOrders(
    int? orderId,
    String orderStatus,
    String vendor,
    String customer,
    String startDate,
    String endDate,
    String orderTotal) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse('https://172.30.1.10:45455/api/OrdersModels/$orderId'),
    //Uri.parse('https://192.168.1.106:45455/api/OrdersModels/$orderId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'orderId': orderId.toString(),
      'orderStatus': orderStatus,
      'vendor': vendor,
      'customer': customer,
      'startDate': startDate,
      'endDate': endDate,
      'orderTotal': orderTotal
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Orders.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update Order.');
  }
}

Future<Balance> updateBalance(
    int? balanceId, int? balance, String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse('https://172.30.1.10:45455/api/BalanceModels/$balanceId'),
    //Uri.parse('https://192.168.1.106:45455/api/BalanceModels/$balanceId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'balanceId': balanceId.toString(),
      'balance': balance.toString(),
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Balance.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update Balance.');
  }
}

Future<Service> createService(
    String serviceName,
    String serviceDescription,
    String ssu,
    String servicePrice,
    int stock,
    String serviceSpecialPrice,
    String specialPriceStart,
    String specialPriceEnd,
    String taxType,
    String isPublished,
    String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/ServiceInformationModels'),
    //Uri.parse('https://192.168.1.106:45455/api/ServiceInformationModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'ssu': ssu,
      'servicePrice': servicePrice,
      'stock': stock.toString(),
      'serviceSpecialPrice': serviceSpecialPrice,
      'specialPriceStart': specialPriceStart,
      'specialPriceEnd': specialPriceEnd,
      'taxType': taxType,
      'isPublished': isPublished,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Service.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<Service> updateService(
    int? serviceId,
    String serviceName,
    String serviceDescription,
    String ssu,
    String servicePrice,
    int stock,
    String serviceSpecialPrice,
    String specialPriceStart,
    String specialPriceEnd,
    String taxType,
    String isPublished,
    String vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse(
        'https://172.30.1.10:45455/api/ServiceInformationModels/$serviceId'),
    //Uri.parse(
    //   'https://192.168.1.106:45455/api/ServiceInformationModels/$serviceId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'serviceId': serviceId.toString(),
      'serviceName': serviceName,
      'serviceDescription': serviceDescription,
      'ssu': ssu,
      'servicePrice': servicePrice,
      'stock': stock.toString(),
      'serviceSpecialPrice': serviceSpecialPrice,
      'specialPriceStart': specialPriceStart,
      'specialPriceEnd': specialPriceEnd,
      'taxType': taxType,
      'isPublished': isPublished,
      'vendor': vendor
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return Service.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update service.');
  }
}

Future<List<Sidebar>> fetchSidebar() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/VendorSidebarModels'));
  //final response = await http
  //   .get(Uri.parse('https://192.168.1.106:45455/api/VendorSidebarModels'));
  List<Sidebar> sidebar = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var sidebarJson = json.decode(response.body);
    for (var sidebarJson in sidebarJson) {
      sidebar.add(Sidebar.fromJson(sidebarJson));
    }
    return sidebar;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Sidebar');
  }
}

Future<List<Balance>> fetchBalance() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response =
      await http.get(Uri.parse('https://172.30.1.10:45455/api/BalanceModels'));
  //final response = await http
  //  .get(Uri.parse('https://192.168.1.106:45455/api/BalanceModels'));
  List<Balance> balance = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var balanceJson = json.decode(response.body);
    for (var balanceJson in balanceJson) {
      balance.add(Balance.fromJson(balanceJson));
    }
    return balance;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Balance');
  }
}

Future<List<Service>> fetchService(String? vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.get(Uri.parse(
      'https://172.30.1.10:45455/api/ServiceInformationModels/$vendor/name'));
  //final response = await http.get(
  //   Uri.parse('https://192.168.1.106:45455/api/ServiceInformationModels/$vendor/name'));
  List<Service> service = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var serviceJson = json.decode(response.body);
    for (var serviceJson in serviceJson) {
      service.add(Service.fromJson(serviceJson));
    }
    return service;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<List<Orders>> fetchOrders(String? vendor) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.get(
      Uri.parse('https://172.30.1.10:45455/api/OrdersModels/$vendor/name'));
  //final response =
  // await http.get(Uri.parse('https://192.168.1.106:45455/api/OrdersModels/$vendor/name'));
  List<Orders> orders = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var ordersJson = json.decode(response.body);
    for (var ordersJson in ordersJson) {
      orders.add(Orders.fromJson(ordersJson));
    }
    return orders;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Orders');
  }
}

Future<http.Response> deleteService(int? id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://172.30.1.10:45455/api/ServiceInformationModels/$id'),
    //final http.Response response = await http.delete(
    // Uri.parse('https://192.168.1.106:45455/api/ServiceInformationModels/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}

Future<http.Response> deleteServiceVariation(int? id) async {
  final http.Response response = await http.delete(
    //Uri.parse('https://192.168.1.106:45455/api/ServiceVariationsModels/$id'),
    Uri.parse('https://172.30.1.10:45455/api/ServiceVariationsModels/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}

Future<http.Response> deleteServiceMapping(int? id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://172.30.1.10:45455/api/ServiceMappingModels/$id'),
    // Uri.parse('https://192.168.1.106:45455/api/ServiceMappingModels/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}

Future<http.Response> deleteServiceImage(int? id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://172.30.1.10:45455/api/ServiceImageModels/$id'),
    // Uri.parse('https://192.168.1.106:45455/api/ServiceImageModels/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}

Future<List<Navbar>> fetchNavbar() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/UserNavbarModels'));
  // final response = await http
  //    .get(Uri.parse('https://192.168.1.106:45455/api/UserNavbarModels'));
  List<Navbar> navbar = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var navbarJson = json.decode(response.body);
    for (var navbarJson in navbarJson) {
      navbar.add(Navbar.fromJson(navbarJson));
    }
    return navbar;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Sidebar');
  }
}

Future<List<Transactions>> fetchTransactions() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/TransactionsModels'));
  // final response = await http
  //    .get(Uri.parse('https://192.168.1.106:45455/api/TransactionsModels'));
  List<Transactions> transactions = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var transactionsJson = json.decode(response.body);
    for (var transactionsJson in transactionsJson) {
      transactions.add(Transactions.fromJson(transactionsJson));
    }
    return transactions;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Transactions');
  }
}

Future<List<Cards>> fetchCards() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response =
      await http.get(Uri.parse('https://172.30.1.10:45455/api/CardsModels'));
  // final response =
  //   await http.get(Uri.parse('https://192.168.1.106:45455/api/CardsModels'));
  List<Cards> cards = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var cardsJson = json.decode(response.body);
    for (var cardsJson in cardsJson) {
      cards.add(Cards.fromJson(cardsJson));
    }
    return cards;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Cards');
  }
}

Future<List<Image1>> fetchImage() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response =
      await http.get(Uri.parse('https://172.30.1.10:45455/api/ImageModels'));
//  final response =
  //    await http.get(Uri.parse('https://192.168.1.106:45455/api/ImageModels'));
  List<Image1> image = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var imageJson = json.decode(response.body);
    for (var imageJson in imageJson) {
      image.add(Image1.fromJson(imageJson));
    }
    return image;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Image');
  }
}

Future<List<BusinessInfo>> fetchBusinessInfo() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/BusinessInfoModels'));
//  final response = await http
  //   .get(Uri.parse('https://192.168.1.106:45455/api/BusinessInfoModels'));
  List<BusinessInfo> businessInfo = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var businessInfoJson = json.decode(response.body);
    for (var businessInfoJson in businessInfoJson) {
      businessInfo.add(BusinessInfo.fromJson(businessInfoJson));
    }
    return businessInfo;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<List<AccountInfo>> fetchAccountInfo() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/AccountInfoModels'));
  // final response = await http
  //   .get(Uri.parse('https://192.168.1.106:45455/api/AccountInfoModels'));
  List<AccountInfo> accountInfo = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var accountInfoJson = json.decode(response.body);
    for (var accountInfoJson in accountInfoJson) {
      accountInfo.add(AccountInfo.fromJson(accountInfoJson));
    }
    return accountInfo;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<List<VendorAddress>> fetchVendorAddress() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/VendorAddressModels'));
  //final response = await http
  //   .get(Uri.parse('https://192.168.1.106:45455/api/VendorAddressModels'));
  List<VendorAddress> vendorAddress = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var vendorAddressJson = json.decode(response.body);
    for (var vendorAddressJson in vendorAddressJson) {
      vendorAddress.add(VendorAddress.fromJson(vendorAddressJson));
    }
    return vendorAddress;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<List<BankInformation>> fetchBankInformation() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/BankInformationModels'));
  //final response = await http
  //    .get(Uri.parse('https://192.168.1.106:45455/api/BankInformationModels'));
  List<BankInformation> bankInformation = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var bankInformationJson = json.decode(response.body);
    for (var bankInformationJson in bankInformationJson) {
      bankInformation.add(BankInformation.fromJson(bankInformationJson));
    }
    return bankInformation;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<List<Faq>> fetchFaq() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response =
      await http.get(Uri.parse('https://172.30.1.10:45455/api/FaqModels'));
  // final response =
  //    await http.get(Uri.parse('https://192.168.1.106:45455/api/FaqModels'));
  List<Faq> faq = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var faqJson = json.decode(response.body);
    for (var faqJson in faqJson) {
      faq.add(Faq.fromJson(faqJson));
    }
    return faq;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Sidebar');
  }
}

Future<List<ContactQ>> fetchContactQ() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response =
      await http.get(Uri.parse('https://172.30.1.10:45455/api/ContactQModels'));
  // final response = await http
  //    .get(Uri.parse('https://192.168.1.106:45455/api/ContactQModels'));
  List<ContactQ> contactq = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var contactqJson = json.decode(response.body);
    for (var contactqJson in contactqJson) {
      contactq.add(ContactQ.fromJson(contactqJson));
    }
    return contactq;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Sidebar');
  }
}

Future<List<VendorReg>> fetchVendorReg() async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http
      .get(Uri.parse('https://172.30.1.10:45455/api/VendorRegModels'));
//  final response = await http
  //   .get(Uri.parse('https://192.168.1.106:45455/api/VendorRegModels'));
  List<VendorReg> vendorReg = [];

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var vendorRegJson = json.decode(response.body);
    for (var vendorRegJson in vendorRegJson) {
      vendorReg.add(VendorReg.fromJson(vendorRegJson));
    }
    return vendorReg;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Service');
  }
}

Future<UserOrganization> createUserOrganization(
    String companyName,
    int companyRocNumber,
    String address,
    String country,
    String state,
    String city,
    int postalCode,
    String emailAddress,
    String password,
    String contactNumber) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/Authenticate/UserOrganization'),
    // final response = await http.post(
    //   Uri.parse('https://192.168.1.106:45455/api/Authenticate/UserOrganization'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'companyName': companyName,
      'companyRocNumber': companyRocNumber.toString(),
      'address': address,
      'country': country,
      'state': state,
      'city': city,
      'postalCode': postalCode.toString(),
      'emailAddress': emailAddress,
      'password': password,
      'contactNumber': contactNumber,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserOrganization.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<UserOrganization> createUserOrganization2(
    String companyName,
    int companyRocNumber,
    String address,
    String country,
    String state,
    String city,
    int postalCode,
    String emailAddress,
    String password,
    String contactNumber) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/UserOrganizationModels'),
    // final response = await http.post(
    //  Uri.parse('https://192.168.1.106:45455/api/UserOrganizationModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'companyName': companyName,
      'companyRocNumber': companyRocNumber.toString(),
      'address': address,
      'country': country,
      'state': state,
      'city': city,
      'postalCode': postalCode.toString(),
      'emailAddress': emailAddress,
      'password': password,
      'contactNumber': contactNumber,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return UserOrganization.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

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
//     Uri.parse('https://172.30.1.33:45455/api/AddressModels'),
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
//     Uri.parse('https://172.30.1.33:45455/api/BankInfoModels'),
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
//     Uri.parse('https://172.30.1.33:45455/api/BusinessCateModels'),
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
//     Uri.parse('https://172.30.1.33:45455/api/BusinessInfoModels'),
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

Future<VendorReg> createVendorReg(
  String businessType,
  String vendorName,
  int registerOfCompanyNo,
  String email,
  String companyDescription,
  int introducerCode,
  String contactNumber,
  int verificationCode,
  String mondayCheck,
  String tuesdayCheck,
  String wednesdayCheck,
  String thursdayCheck,
  String fridayCheck,
  String saturdayCheck,
  String sundayCheck,
  String startBusinessHours,
  String endBusinessHours,
  String personInChargeName,
  String emailAddress,
  String password,
  String confirmPassword,
  String contactNumber2,
  int verificationCode2,
  String serviceCategory,
  String businessCategory,
  String typeOfBusiness,
  String countryCategory,
  String restaurantCategory,
  String typeOfFood,
  String address,
  String country,
  String state,
  String city,
  int postcode,
  String shopLatitude,
  String shopLongitude,
  String flatRate,
  String forFirst,
  String everyAdditional,
  String bankName,
  int bankAccountNo,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/Authenticate/VendorReg'),
    //Uri.parse('https://192.168.1.106:45455/api/Authenticate/VendorReg'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'businessType': businessType, //
      'vendorName': vendorName,
      'registerOfCompanyNo': registerOfCompanyNo.toString(),
      'email': email,
      'companyDescription': companyDescription,
      'introducerCode': introducerCode.toString(),
      'contactNumber': contactNumber,
      'verificationCode': verificationCode.toString(),
      'mondayCheck': mondayCheck, //
      'tuesdayCheck': tuesdayCheck, //
      'wednesdayCheck': wednesdayCheck, //
      'thursdayCheck': thursdayCheck, //
      'fridayCheck': fridayCheck, //
      'saturdayCheck': saturdayCheck, //
      'sundayCheck': sundayCheck, //
      'startBusinessHours': startBusinessHours, //
      'endBusinessHours': endBusinessHours, //
      'personInChargeName': personInChargeName,
      'emailAddress': emailAddress,
      'password': password,
      'confirmPassword': confirmPassword,
      'contactNumber2': contactNumber2,
      'verificationCode2': verificationCode2.toString(),
      'serviceCategory': serviceCategory, //
      'businessCategory': businessCategory, //
      'typeOfBusiness': typeOfBusiness, //
      'countryCategory': countryCategory, //
      'restaurantCategory': restaurantCategory, //
      'typeOfFood': typeOfFood, //
      'address': address,
      'country': country, //
      'state': state, //
      'city': city, //
      'postcode': postcode.toString(),
      'shopLatitude': shopLatitude,
      'shopLongitude': shopLongitude,
      'flatRate': flatRate,
      'forFirst': forFirst,
      'everyAdditional': everyAdditional,
      'bankName': bankName, //
      'bankAccountNo': bankAccountNo.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return VendorReg.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create vendor.');
  }
}

Future<VendorReg> createVendorReg2(
  String businessType,
  String vendorName,
  int registerOfCompanyNo,
  String email,
  String companyDescription,
  int introducerCode,
  String contactNumber,
  int verificationCode,
  String mondayCheck,
  String tuesdayCheck,
  String wednesdayCheck,
  String thursdayCheck,
  String fridayCheck,
  String saturdayCheck,
  String sundayCheck,
  String startBusinessHours,
  String endBusinessHours,
  String personInChargeName,
  String emailAddress,
  String password,
  String confirmPassword,
  String contactNumber2,
  int verificationCode2,
  String serviceCategory,
  String businessCategory,
  String typeOfBusiness,
  String countryCategory,
  String restaurantCategory,
  String typeOfFood,
  String address,
  String country,
  String state,
  String city,
  int postcode,
  String shopLatitude,
  String shopLongitude,
  String flatRate,
  String forFirst,
  String everyAdditional,
  String bankName,
  int bankAccountNo,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/VendorRegModels'),
    //Uri.parse('https://192.168.1.106:45455/api/VendorRegModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'businessType': businessType, //
      'vendorName': vendorName,
      'registerOfCompanyNo': registerOfCompanyNo.toString(),
      'email': email,
      'companyDescription': companyDescription,
      'introducerCode': introducerCode.toString(),
      'contactNumber': contactNumber,
      'verificationCode': verificationCode.toString(),
      'mondayCheck': mondayCheck, //
      'tuesdayCheck': tuesdayCheck, //
      'wednesdayCheck': wednesdayCheck, //
      'thursdayCheck': thursdayCheck, //
      'fridayCheck': fridayCheck, //
      'saturdayCheck': saturdayCheck, //
      'sundayCheck': sundayCheck, //
      'startBusinessHours': startBusinessHours, //
      'endBusinessHours': endBusinessHours, //
      'personInChargeName': personInChargeName,
      'emailAddress': emailAddress,
      'password': password,
      'confirmPassword': confirmPassword,
      'contactNumber2': contactNumber2,
      'verificationCode2': verificationCode2.toString(),
      'serviceCategory': serviceCategory, //
      'businessCategory': businessCategory, //
      'typeOfBusiness': typeOfBusiness, //
      'countryCategory': countryCategory, //
      'restaurantCategory': restaurantCategory, //
      'typeOfFood': typeOfFood, //
      'address': address,
      'country': country, //
      'state': state, //
      'city': city, //
      'postcode': postcode.toString(),
      'shopLatitude': shopLatitude,
      'shopLongitude': shopLongitude,
      'flatRate': flatRate,
      'forFirst': forFirst,
      'everyAdditional': everyAdditional,
      'bankName': bankName, //
      'bankAccountNo': bankAccountNo.toString(),
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return VendorReg.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create vendor.');
  }
}

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
//     Uri.parse('https://172.30.1.33:45455/api/BusinessCateModels'),
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

Future<Suggest> createSuggest(
  String vendorName,
  String ownerName,
  int hpNumber,
  int telNumber,
  String emailAddress,
  String street,
  int postalCode,
  String city,
  String state,
  String country,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/SuggestModels'),
    //Uri.parse('https://192.168.1.106:45455/api/SuggestModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'vendorName': vendorName,
      'ownerName': ownerName,
      'hpNumber': hpNumber.toString(),
      'telNumber': telNumber.toString(),
      'emailAddress': emailAddress,
      'street': street,
      'postalCode': postalCode.toString(),
      'city ': city,
      'state': state,
      'country': country,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Suggest.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<Contact> createContact(
  // String q1,
  // String q2,
  // String q3,
  // String q4,
  String selectDepartment,
  String name,
  String email,
  String subject,
  int contactNumber,
  String message,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/ContactModels'),
    //Uri.parse('https://192.168.1.106:45455/api/ContactModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      // 'q1': q1,
      // 'q2': q2,
      // 'q3': q3,
      // 'q4': q4,
      'selectDepartment': selectDepartment,
      'name': name,
      'email': email,
      'subject': subject,
      'contactNumber': contactNumber.toString(),
      'message': message,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Contact.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<Faq> createFaq(
  String question1,
  String content1,
  String question2,
  String content2,
  String question3,
  String content3,
  String question4,
  String content4,
  String question5,
  String content5,
  String question6,
  String content6,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/FaqModels'),
    //Uri.parse('https://192.168.1.106:45455/api/FaqModels'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'question1': question1,
      'content1': content1,
      'question2': question2,
      'content2': content2,
      'question3': question3,
      'content3': content3,
      'question4': question4,
      'content4': content4,
      'question5': question5,
      'content5': content5,
      'question6': question6,
      'content6': content6,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Faq.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }
}

Future<BusinessInfo> createBusinessInfo(
    // String companyName,
    // String rocNumber,
    // String vendorEmail,
    // String businessType,
    String contactNumber,
    String companyDescription,
    //String businessLogo,
    String businessStartTime,
    String businessFinishTime,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
    String sunday,
    String isPublished) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/BusinessInfoModels'),
    //Uri.parse('https://192.168.1.106:45455/api/BusinessInfoModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      // 'companyName': companyName,
      // 'rocNumber': rocNumber,
      // 'vendorEmail': vendorEmail,
      // 'businessType': businessType,
      'contactNumber': contactNumber,
      'companyDescription': companyDescription,
      'businessStartTime': businessStartTime,
      'businessFinishTime': businessFinishTime,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return BusinessInfo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<BusinessInfo> updateBusinessInfo(
  int? businessInfoId,
  String contactNumber,
  String companyDescription,
  //String businessLogo,
  String businessStartTime,
  String businessFinishTime,
  String monday,
  String tuesday,
  String wednesday,
  String thursday,
  String friday,
  String saturday,
  String sunday,
  String isPublished,
  String personInChargeName,
  String phoneNumber,
  //String businessLogo,
  String vendorEmail,
  String isPublished2,
  String vendorAddress,
  String country,
  String state,
  String city,
  String postCode,
  String businessLatitude,
  String businessLongitude,
  String isPublished3,
  String bankName,
  String accountNumber,
  String isPublished4,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse(
        'https://172.30.1.10:45455/api/BusinessInfoModels/$businessInfoId'),
    //Uri.parse(
    //    'https://192.168.1.106:45455/api/BusinessInfoModels/$businessInfoId'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'businessInfoId': businessInfoId.toString(),
      'contactNumber': contactNumber,
      'companyDescription': companyDescription,
      'businessStartTime': businessStartTime,
      'businessFinishTime': businessFinishTime,
      'monday': monday,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'sunday': sunday,
      'isPublished': isPublished,
      'personInChargeName': personInChargeName,
      'phoneNumber': phoneNumber,
      'vendorEmail': vendorEmail,
      'isPublished2': isPublished2,
      'vendorAddress': vendorAddress,
      'country': country,
      'state': state,
      'city': city,
      'postCode': postCode,
      'businessLatitude': businessLatitude,
      'businessLongitude': businessLongitude,
      'isPublished3': isPublished3,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'isPublished4': isPublished4,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return BusinessInfo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<AccountInfo> createAccountInfo(
    String personInChargeName,
    String phoneNumber,
    String vendorEmail,
    // String selectedBusinessCate,
    String isPublished) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/AccountInfoModels'),
    //Uri.parse('https://192.168.1.106:45455/api/AccountInfoModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'personInChargeName': personInChargeName,
      'phoneNumber': phoneNumber,
      'vendorEmail': vendorEmail,
      // 'selectedBusinessCate': selectedBusinessCate,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AccountInfo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<AccountInfo> updateAccountInfo(
    int? accountInfoId,
    String personInChargeName,
    String phoneNumber,
    String vendorEmail,
    //String selectedBusinessCate,
    String isPublished) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse('https://172.30.1.10:45455/api/AccountInfoModels/$accountInfoId'),
    //Uri.parse(
    //    'https://192.168.1.106:45455/api/AccountInfoModels/$accountInfoId'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'accountInfoId': accountInfoId.toString(),
      'personInChargeName': personInChargeName,
      'phoneNumber': phoneNumber,
      'vendorEmail': vendorEmail,
      //  'selectedBusinessCate': selectedBusinessCate,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return AccountInfo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<VendorAddress> createVendorAddress(
    String vendorAddress,
    String country,
    String state,
    String city,
    String postCode,
    String businessLatitude,
    String businessLongitude,
    String isPublished) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/VendorAddressModels'),
    //Uri.parse('https://192.168.1.106:45455/api/VendorAddressModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'vendorAddress': vendorAddress,
      'country': country,
      'state': state,
      'city': city,
      'postCode': postCode,
      'businessLatitude': businessLatitude,
      'businessLongitude': businessLongitude,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return VendorAddress.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<VendorAddress> updateVendorAddress(
    int? vendorAddressId,
    String vendorAddress,
    String country,
    String state,
    String city,
    String postCode,
    String businessLatitude,
    String businessLongitude,
    String isPublished) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse(
        'https://172.30.1.10:45455/api/VendorAddressModels/$vendorAddressId'),
    //Uri.parse(
    //    'https://192.168.1.106:45455/api/VendorAddressModels/$vendorAddressId'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'vendorAddressId': vendorAddressId.toString(),
      'vendorAddress': vendorAddress,
      'country': country,
      'state': state,
      'city': city,
      'postCode': postCode,
      'businessLatitude': businessLatitude,
      'businessLongitude': businessLongitude,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return VendorAddress.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<BankInformation> createBankInformation(
  String bankName,
  String accountNumber,
  String isPublished,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.post(
    Uri.parse('https://172.30.1.10:45455/api/BankInformationModels'),
    //Uri.parse('https://192.168.1.106:45455/api/BankInformationModels'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'bankName': bankName,
      'accountNumber': accountNumber,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return BankInformation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}

Future<BankInformation> updateBankInformation(
  int? bankInformationId,
  String bankName,
  String accountNumber,
  String isPublished,
) async {
  HttpOverrides.global = new MyHttpOverrides();
  final response = await http.put(
    Uri.parse(
        'https://172.30.1.10:45455/apiBankInformationModels/$bankInformationId'),
    //Uri.parse(
    //    'https://192.168.1.106:45455/api/BankInformationModels/$bankInformationId'),

    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'bankInformationId': bankInformationId.toString(),
      'bankName': bankName,
      'accountNumber': accountNumber,
      'isPublished': isPublished,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 CREATED response,
    // then parse the JSON.
    return BankInformation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create service.');
  }
}
