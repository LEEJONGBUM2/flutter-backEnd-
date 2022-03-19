import 'package:flutter/material.dart';
import 'package:iconnexz/LogInPage/FindPasswordDesktop.dart';
import 'package:iconnexz/LogInPage/FindPasswordMobile.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class FindPassword extends StatelessWidget {
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
              child: ScreenTypeLayout(
                mobile: FindPasswordMobile(),
                desktop: FindPasswordDesktop(),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
