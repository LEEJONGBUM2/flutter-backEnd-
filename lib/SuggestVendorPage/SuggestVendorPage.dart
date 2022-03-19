import 'package:flutter/material.dart';
import 'package:iconnexz/SuggestVendorPage/SuggestVendorDesktop.dart';
import 'package:iconnexz/SuggestVendorPage/SuggestVendorMobile.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/SuggestBanner/SuggestBanner.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class SuggestVendorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Navbar(),
            SuggestBanner(),
            Expanded(
              child: ScreenTypeLayout(
                mobile: SuggestVendorMobile(),
                desktop: SuggestVendorDesktop(),
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
