import 'package:flutter/material.dart';

class EateriesList extends StatelessWidget {
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
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Food Trucks',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Restaurant',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Gourmet',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Beverage',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
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
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Outlet Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Halal Cuisine',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Bakery',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Home Cooking',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Food Stalls',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Scenic Places',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            'Clubs & Bars',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
    ]);
  }
}
