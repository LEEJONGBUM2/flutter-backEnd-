import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconnexz/CountryPage/Countries.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:iconnexz/CountryPage/Country.dart';

class CountrySelectCard extends StatelessWidget {
  const CountrySelectCard({Key? key, required this.countries})
      : super(key: key);
  final Countries countries;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Color(0xffEFEFEF),
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, countries.routename);
            },
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Image(
                          image: AssetImage(countries.image),
                          width: 100,
                          height: 10),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: AutoSizeText(countries.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            maxLines: 1)),
                  ]),
            )));
  }
}
