import 'package:flutter/material.dart';

class ChickenPageList extends StatelessWidget {
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
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/CulturalFoods');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              'Cultural Foods',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/ChickenRice');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29),
            child: Text(
              'Chicken Rice',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/BBQChickenRice');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text(
              'BBQ Chicken Rice',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Haineese Chicken Rice',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'BBQ Chicken',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Steamed Chicken Rice',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Coffee',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Ice Lemon Tea',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Water',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Soft Drink',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
    ]);
  }
}
