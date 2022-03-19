import 'dart:js';

import 'package:flutter/material.dart';
import 'package:iconnexz/FAQPage/FAQPage.dart';
import 'package:iconnexz/LandingPage/CategoryList.dart';
import 'package:iconnexz/LandingPage/LandingPage.dart';
import 'package:iconnexz/LandingPage/Products.dart';
import 'package:iconnexz/LandingPage/Selection.dart';

class Categories extends StatelessWidget {
  double size = 30;
  final _scrollController = ScrollController();
  double box = 1.2 / .8;
  double space = 10.0;
  double horz = 10;
  List<Widget> pageChildren(
      double width, double size, double box, double space, double horz) {
    return <Widget>[
      Container(
          width: width - 50,
          height: 500,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Service Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RaleWay',
                              fontSize: size),
                        ),
                        CategoryList()
                      ]))),
      Expanded(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: horz, vertical: 10),
              child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: GridView.count(
                      controller: _scrollController,
                      crossAxisCount: 3,
                      crossAxisSpacing: space,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: box,
                      children: List.generate(choices.length, (index) {
                        return Center(
                          child: SelectCard(choice: choices[index]),
                        );
                      }))))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        if (constraints.maxWidth > 1000) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(
                constraints.biggest.width / 3, size, box, space, horz),
          );
        } else if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 3.1, size - 7,
                box = 2 / 1.5, space / 2.4, horz / 1.4),
          );
        } else if (constraints.maxWidth > 640) {
          return Row(
              children: pageChildren(constraints.biggest.width / 2.8, size - 9,
                  box = 2 / 2, space / 2.4, horz / 2.5));
        } else if (constraints.maxWidth > 600) {
          return Row(
              children: pageChildren(constraints.biggest.width / 2.8, size - 11,
                  box = 2 / 2, space / 2.4, horz / 2.5));
        } else if (constraints.maxWidth > 560) {
          return Row(
              children: pageChildren(constraints.biggest.width / 2.8, size - 13,
                  box = 2 / 2, space / 2.4, horz / 2.5));
        } else {
          return Row(
            children: pageChildren(constraints.biggest.width / 2.8, size - 16,
                box = 2 / 2, space / 2.4, horz / 2.5),
          );
        }
      },
    );
  }
}
