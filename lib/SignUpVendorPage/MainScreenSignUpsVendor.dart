import 'package:flutter/material.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendor.dart';
import 'package:iconnexz/VendorAccount/VendorAccountEdit.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/components/sidebar_mobile.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/responsive.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/SignUpVendorBanner/SignUpVendorBanner.dart';
import 'package:provider/provider.dart';

class MainScreenSignUpsVendor extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MainScreenSignUpsVendor> {
  int navIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      // drawer: Sidenav(navIndex, (int index) {
      //   setState(() {
      //     navIndex = index;
      //   });
      // }),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              // Expanded(
              //   // default flex = 1
              //   // and it takes 1/6 part of the screen
              //   child: Sidenav(navIndex, (int index) {
              //     setState(() {
              //       navIndex = index;
              //     });
              //   }),
              // ),
              if (Responsive.isMobile(context))
                Container(
                  width: 60,
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  // child: SidenavMobile(navIndex, (int index) {
                  //   setState(() {
                  //     navIndex = index;
                  //   });
                  // }),
                ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SignUpsVendor(),
            ),
          ],
        ),
      ),
    );
  }
}
