import 'package:flutter/material.dart';

class CateringList extends StatelessWidget {
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
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Gourmet',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Malaysian Dishes',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Finger Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Halal Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/Country');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'Cultural Food',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Festive Dishes',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Venue Hosting',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Fusion Foods',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Soup Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Spicy Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Fast Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            'Healthy Food',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
    ]);
  }
}
