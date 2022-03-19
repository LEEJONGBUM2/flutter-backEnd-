import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/Chicken%20Rice/ChickenRice.dart';
import 'package:iconnexz/CulturalFoodPage/CulturalFood.dart';

class SelectChickenRice extends StatelessWidget {
  const SelectChickenRice({Key? key, required this.chickenRice})
      : super(key: key);
  final ChickenRice chickenRice;

  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, chickenRice.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(top: 10),
                        child: Image(
                            image: AssetImage(chickenRice.image),
                            width: 150,
                            height: 10),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          chickenRice.title,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: text / 60),
                        )),
                  ]),
            )));
  }
}
