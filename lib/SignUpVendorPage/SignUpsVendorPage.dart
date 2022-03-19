import 'package:flutter/material.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendorD.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendorM.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/SignUpVendorBanner/SignUpVendorBanner.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: use_key_in_widget_constructors
class SignUpsVendorPage extends StatelessWidget {
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
                child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          SignUpVendorBanner(),
                          SizedBox(
                            height: 10,
                          ),
                          ScreenTypeLayout(
                            mobile: SignUpsVendorM(),
                            desktop: SignUpsVendorD(),
                          ),
                          //SignUpVendor1Dropdown(),
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
