// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconnexz/LandingPage/Categories.dart';
import 'package:iconnexz/VendorLandingPage/VendorBanner.dart';
import 'package:iconnexz/VendorLandingPage/VendorBody.dart';
import 'package:iconnexz/widgets/BotImage/BotImage.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class VendorLandingPage extends StatelessWidget {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
  return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Column(
            children: <Widget>[
              Navbar(),
              Expanded(
                child: Scrollbar(isAlwaysShown: true,
                              controller: _scrollController,child: SingleChildScrollView(
                                controller: _scrollController,
                child: Column(
                children: [
                   VendorBanner(),
                  ScreenTypeLayout(
                    mobile: VendorBody(),
                    desktop: VendorBody(),
                  ),
                ],
              ),
              ))),
               Footer(),
            ],
          ),
        ),
      );
}
}