import 'package:flutter/material.dart';
import 'package:iconnexz/BBQChickenRicePage/BBQChickenRiceMain.dart';
import 'package:iconnexz/widgets/BotImage/BotImage.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class BBQChickenRiceScreen extends StatelessWidget {
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
              BotImage(),
              Expanded(flex: 3,
                 child: Scrollbar(isAlwaysShown: true,
                              controller: _scrollController,child: SingleChildScrollView(
                                controller: _scrollController,
                child: Column(
                children: [
                  ScreenTypeLayout(
                  mobile: BBQChickenRiceMain(),
                  desktop: BBQChickenRiceMain(),
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