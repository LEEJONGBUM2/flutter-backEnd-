import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      SizedBox(height: 10),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/Eateries');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Eateries',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/Catering');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11),
            child: Text(
              'Catering',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/Country');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'Country',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            'China',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/CulturalFoods');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              'Malaysia',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            'Pakistan',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            'SouthKorea',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Text(
            'USA',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
    ]);
  }
}
