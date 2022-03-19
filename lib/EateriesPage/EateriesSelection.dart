import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/EateriesPage/Eateries.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectEateries extends StatelessWidget {
  const SelectEateries({Key? key, required this.eateries}) : super(key: key);
  final Eateries eateries;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, eateries.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                          image: AssetImage(eateries.image),
                          width: 100,
                          height: 10),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(eateries.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 1)),
                  ]),
            )));
  }
}
