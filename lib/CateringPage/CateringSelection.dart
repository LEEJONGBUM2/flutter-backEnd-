import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/CateringPage/Catering.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SelectCatering extends StatelessWidget {
  const SelectCatering({Key? key, required this.catering}) : super(key: key);
  final Catering catering;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, catering.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                          image: AssetImage(catering.image),
                          width: 100,
                          height: 10),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(catering.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 1)),
                  ]),
            )));
  }
}
