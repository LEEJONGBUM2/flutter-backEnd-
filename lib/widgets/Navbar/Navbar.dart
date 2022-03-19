import 'package:flutter/material.dart';
import 'package:iconnexz/widgets/Navbar/NavbarDesktop.dart';
import 'package:iconnexz/widgets/Navbar/NavbarMobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      // Check the sizing information here and return your UI
      if (constraints.maxWidth > 1200) {
        return NavbarDesktop();
      } else if (constraints.maxWidth > 0 && constraints.maxWidth < 1030) {
        return NavbarMobile();
      } else {
        return NavbarDesktop();
      }
    });
  }
}
