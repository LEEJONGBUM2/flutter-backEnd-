import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/LandingPage/Products.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, choice.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                          image: AssetImage(choice.image),
                          width: 100,
                          height: 10),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(choice.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 1)),
                  ]),
            )));
  }
}
