import 'package:flutter/material.dart';
import 'package:iconnexz/SignUpPage/SignUpPageDesktopI.dart';
import 'package:iconnexz/SignUpPage/SignUpPageMobileI.dart';
import 'package:iconnexz/SignUpPage/practice.dart';

import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/SignUpBanner/SignUpBanner.dart';
import 'package:iconnexz/widgets/SignUpSelection/SignUpSelection.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class practiceS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ScreenTypeLayout(
                mobile: MyApp(),
                desktop: MyApp(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
