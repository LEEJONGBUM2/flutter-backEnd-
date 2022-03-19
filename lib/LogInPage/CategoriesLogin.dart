import 'package:flutter/material.dart';
import 'package:iconnexz/LogInPage/LogInPageDesktop.dart';

class CategoriesLogin extends StatelessWidget {
  double size = 30;
  double box = 1.2 / .8;
  double space = 10.0;
  double horz = 70;
  List<Widget> pageChildren(
      double width, double size, double box, double space, double horz) {
    return <Widget>[
      Container(
        width: width - 50,
        height: 400,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          'Service Category',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'RaleWay',
              fontSize: size),
        ),
      ),
      Container(
        width: 750,
        height: 700,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: horz, vertical: 10),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        if (constraints.maxWidth > 1300) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(
                constraints.biggest.width / 130, size, box, space, horz),
          );
        } else if (constraints.maxWidth > 1100) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 100.1, size - 17,
                box = 2 / 1.5, space / 5, horz / 2),
          );
        } else if (constraints.maxWidth > 1000) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageChildren(constraints.biggest.width / 90, size - 19,
                  box = 2 / 2, space / 5, horz / 4));
        } else if (constraints.maxWidth > 900) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageChildren(constraints.biggest.width / 90, size - 21,
                  box = 2 / 2, space / 5, horz / 4));
        } else if (constraints.maxWidth > 800) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageChildren(constraints.biggest.width / 90, size - 23,
                  box = 2 / 2, space / 5, horz / 4));
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 90, size - 26,
                box = 2 / 2, space / 5, horz / 4),
          );
        }
      },
    );
  }
}
