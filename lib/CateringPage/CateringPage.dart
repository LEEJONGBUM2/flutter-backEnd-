import 'package:flutter/material.dart';
import 'package:iconnexz/CateringPage/CateringScreen.dart';
import 'package:iconnexz/widgets/BotImage/BotImage.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class CateringPage extends StatelessWidget {
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
              child: ScreenTypeLayout(
                mobile: CateringScreen(),
                desktop: CateringScreen(),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
