import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/CulturalFoodPage/CulturalFood.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectCulturalFood extends StatelessWidget {
  const SelectCulturalFood({Key? key, required this.culturalFood})
      : super(key: key);
  final CulturalFood culturalFood;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, culturalFood.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                          image: AssetImage(culturalFood.image),
                          width: 100,
                          height: 10),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(culturalFood.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 1)),
                  ]),
            )));
  }
}
