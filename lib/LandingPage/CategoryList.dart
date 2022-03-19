import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Services',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Beauty',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'HealthCare',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Education',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Event',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Leisure',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Home & Office',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Finance',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Industries',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'RSVP',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Promotions',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
        ]);
  }
}
