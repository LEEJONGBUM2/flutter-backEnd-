import 'dart:js';

import 'package:flutter/material.dart';
import 'package:iconnexz/Chicken%20Rice/ChickenRice.dart';
import 'package:iconnexz/Chicken%20Rice/ChickenRiceSelection.dart';
import 'package:iconnexz/Chicken%20Rice/ChickenPageList.dart';
import 'package:iconnexz/CountryPage/CountryList.dart';

class ChickenRiceMain extends StatelessWidget {
  double size = 30;
  double secondSize = 15;
  final _scrollController = ScrollController();
  double box = 1.2 / .8;
  double space = 10.0;
  double horz = 10;
  List<Widget> pageChildren(double width, double size, double box, double space,
      double horz, double secondSize) {
    return <Widget>[
      Container(
          width: width,
          height: 424,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                ChickenPageList()
              ]))),
      Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: horz, vertical: 10),
              child: Column(children: <Widget>[
                Container(
                    width: 1160,
                    color: Color(0xffEFEFEF),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                            width: width - 25,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/CulturalFoods/the_chicken_rice_shop-removebg-preview.png"),
                              fit: BoxFit.cover,
                            ))),
                      ]),
                      Column(children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Chicken Rice',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RaleWay',
                              fontSize: size),
                        ),
                        Text(
                          'Old Klang road, Federal Territories, Kuala Lumpur'
                          '\n                           Zipcode: 57000'
                          '\n          Business hours :10:00 AM to 9:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'RaleWay',
                              fontSize: secondSize),
                        ),
                      ])
                    ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 1160,
                    height: 320,
                    color: Colors.white,
                    child: Scrollbar(
                        isAlwaysShown: true,
                        controller: _scrollController,
                        child: GridView.count(
                            controller: _scrollController,
                            crossAxisCount: 3,
                            crossAxisSpacing: space,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: box,
                            children: List.generate(chicken.length, (index) {
                              return Center(
                                child: SelectChickenRice(
                                    chickenRice: chicken[index]),
                              );
                            }))))
              ]))),
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
              children: pageChildren(constraints.biggest.width / 4, size, box,
                  space, horz, secondSize));
        } else if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 3.9, size - 7,
                box = 2 / 1.5, space / 2.4, horz / 1.4, secondSize),
          );
        } else if (constraints.maxWidth > 640) {
          return Row(
              children: pageChildren(constraints.biggest.width / 3.6, size - 9,
                  box = 2 / 2, space / 2.4, horz / 2.5, secondSize - 1));
        } else if (constraints.maxWidth > 600) {
          return Row(
              children: pageChildren(constraints.biggest.width / 3.7, size - 11,
                  box = 2 / 2, space / 2.4, horz / 2.5, secondSize - 2));
        } else if (constraints.maxWidth > 560) {
          return Row(
              children: pageChildren(constraints.biggest.width / 3.8, size - 13,
                  box = 2 / 2, space / 2.4, horz / 2.5, secondSize - 3));
        } else {
          return Row(
            children: pageChildren(constraints.biggest.width / 3.8, size - 16,
                box = 2 / 2, space / 2.4, horz / 2.5, secondSize - 4),
          );
        }
      },
    );
  }
}
