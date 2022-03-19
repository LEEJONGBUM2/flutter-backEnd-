import 'package:flutter/material.dart';

class CulturalList extends StatelessWidget {
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
              'Malaysia',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Mitasu',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Oiso',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'AK Noodle',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Uncle Don',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
            Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Super Saigon',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Namaste',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Brew House',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
              InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/ChickenRice');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 29),
            child: Text(
              'ChickenRice',
              style:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
            ),
          )),
              Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Rock U',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Nandos',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            'Fei Fan',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
             Padding(
          padding: EdgeInsets.symmetric(horizontal: 29),
          child: Text(
            '4 Fingers',
            style:
                TextStyle(fontWeight: FontWeight.normal, fontSize: text / 60),
          )),
      ]);
  }
}