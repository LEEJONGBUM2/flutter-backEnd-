import 'package:flutter/material.dart';
import 'package:iconnexz/FAQPage/FAQBanner.dart';
import 'package:iconnexz/FAQPage/FAQPage.dart';
import 'package:iconnexz/LandingPage/Categories.dart';
import 'package:iconnexz/widgets/BotImage/BotImage.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class FAQLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Navbar(),
              FAQBanner(),
              Expanded(flex: 3,
                child: ScreenTypeLayout(
                  mobile: FAQPage(),
                  desktop: FAQPage(),
                ),
              ),
               Footer(),
            ],
          ),
        ),
      );
}
}