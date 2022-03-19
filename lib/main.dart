import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconnexz/BBQChickenRicePage/BBQChickenRiceScreen.dart';
import 'package:iconnexz/CateringPage/CateringPage.dart';
import 'package:iconnexz/Chicken%20Rice/ChickenRiceScreen.dart';
import 'package:iconnexz/ContactUsPage/ContactUsPage.dart';
import 'package:iconnexz/CountryPage/CountryScreen.dart';
import 'package:iconnexz/CulturalFoodPage/CulturalFoodPage.dart';
import 'package:iconnexz/EateriesPage/EateriesPage.dart';
import 'package:iconnexz/FAQPage/FAQLanding.dart';
import 'package:iconnexz/LandingPage/LandingPage.dart';
import 'package:iconnexz/LogInPage/LogInPage.dart';
import 'package:iconnexz/ShoppingCart/ShoppingCart.dart';
import 'package:iconnexz/ShoppingCart/ShoppingCart2.dart';
import 'package:iconnexz/SignUpPage/SignUpPageO.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendorPage.dart';
import 'package:iconnexz/VendorAccount/ChangePassword.dart';
import 'package:iconnexz/VendorAccount/MainScreenAccount.dart';
import 'package:iconnexz/VendorAccount/MainScreenAccountEdit.dart';
import 'package:iconnexz/VendorAccount/MainScreenUpdatedVendor.dart';
import 'package:iconnexz/VendorManageService/MainScreen2.dart';
import 'package:iconnexz/SignUpPage/SignUpPageI.dart';
import 'package:iconnexz/SuggestVendorPage/SuggestVendorPage.dart';
import 'package:iconnexz/VendorLandingPage/VendorLandingPage.dart';
import 'package:iconnexz/VendorManageService/MainScreenUpdate.dart';
import 'package:iconnexz/VendorReports/MainScreenReports.dart';
import 'package:iconnexz/VendorVoucher/MainScreenCampaign.dart';
import 'package:iconnexz/VendorVoucher/MainScreenVoucher.dart';
import 'package:iconnexz/VendorWallet/MainScreenCard.dart';
import 'package:iconnexz/VendorManageService/MainScreenCreate.dart';
import 'package:iconnexz/VendorOrders/MainScreenHistory.dart';
import 'package:iconnexz/VendorOrders/MainScreenOrder.dart';
import 'package:iconnexz/VendorManageService/MainScreenService.dart';
import 'package:iconnexz/VendorWallet/MainScreenSend.dart';
import 'package:iconnexz/VendorWallet/MainScreenTopup.dart';
import 'package:iconnexz/VendorWallet/MainScreenWallet.dart';
import 'package:iconnexz/VendorManageService/Service.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/VendorDashboard/Dashboard.dart';
import 'package:iconnexz/VendorDashboard/main_screen.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        navigatorKey: OneContext().key,
        title: 'Iconnexz',
        theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            primarySwatch: Colors.blue,
            canvasColor: secondaryColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply()),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.

          '/SignupsVendor': (context) => SignUpsVendorPage(),
          '/Suggest': (context) => SuggestVendorPage(),
          '/Contact': (context) => ContactUsPage(),
          '/Signup': (context) => SignUpPage(),
          '/SignupO': (context) => SignUpPageO(),
          '/': (context) => LandingPage(),
          '/Login': (context) => LogInPage(),
          '/BecomeAVendor': (context) => VendorLandingPage(),
          '/Eateries': (context) => EateriesPage(),
          '/FAQ': (context) => FAQLanding(),
          '/ShoppingCart': (context) => ShoppingCart(),
          '/Payment': (context) => ShoppingCart2(),
          '/Catering': (context) => CateringPage(),
          '/CulturalFoods': (context) => CulturalFoodPage(),
          '/ChickenRice': (context) => ChickenRiceScreen(),
          '/Country': (context) => CountryScreen(),
          '/BBQChickenRice': (context) => BBQChickenRiceScreen(),
          '/ManageService': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreen2(),
              ),
          '/Dashboard': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreen(),
              ),
          '/Service': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenService(),
              ),
          '/CreateService': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenCreate(),
              ),
          '/Wallet': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenWallet(),
              ),
          '/Cards': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenCard(),
              ),

          '/Orders': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenOrder(),
              ),
          '/OrderHistory': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenHistory(),
              ),
          '/Voucher': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenVoucher(),
              ),
          '/Campaign': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenCampaign(),
              ),
          '/Reports': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenReports(),
              ),
          // '/VendorAccount': (context) => MultiProvider(
          //       providers: [
          //         ChangeNotifierProvider(
          //           create: (context) => MenuController(),
          //         ),
          //       ],
          //       child: MainScreenAccount(),
          //     ),

          '/VendorAccountEdit': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: MainScreenUpdatedVendor(),
              ),

          '/ChangePassword': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => MenuController(),
                  ),
                ],
                child: ChangePassword(),
              ),
        },
        initialRoute: '/',
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
