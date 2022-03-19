// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconnexz/BBQChickenRicePage/BBQChickenRicePageList.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconnexz/BBQChickenRicePage/DialogBox.dart';

class BBQChickenRiceMain extends StatefulWidget {
  @override
  _BBQChickenRiceMain createState() => _BBQChickenRiceMain();
}

class _BBQChickenRiceMain extends State<BBQChickenRiceMain> {
  double size = 30;
  double secondSize = 15;
  final _scrollController = ScrollController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  double fieldSize = 300;
  double horz = 10;
  double secondHorz = 140;
  List<Widget> pageChildren(double width, double size, double horz,
      double secondSize, double secondHorz, double fieldSize) {
    return <Widget>[
      Container(
          width: width,
          height: 855,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Text(
                  'Service Category',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RaleWay',
                      fontSize: size),
                ),
                BBQChickenRicePageList()
              ]))),
      Expanded(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: horz, vertical: 10),
              child: Column(children: <Widget>[
                Container(
                    width: 1160,
                    color: Color(0xffEFEFEF),
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                            width: width - 25,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/CulturalFoods/the_chicken_rice_shop-removebg-preview.png"),
                              fit: BoxFit.cover,
                            ))),
                      ]),
                      Column(children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Chicken Rice',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RaleWay',
                              fontSize: size),
                        ),
                        Text(
                          'Old Klang road, Federal Territories, Kuala Lumpur'
                          '\n                           Zipcode: 57000'
                          '\n          Business hours :10:00 AM to 9:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'RaleWay',
                              fontSize: secondSize),
                        ),
                      ])
                    ])),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 1160,
                  height: 700,
                  color: Colors.white,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  child: Text(
                                    'BBQ Chicken Rice',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RaleWay',
                                        fontSize: size),
                                  )),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 2),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(height: 10),
                              Container(
                                  width: width + 50,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/ChickenRice/1.jpg"),
                                    fit: BoxFit.fill,
                                  ))),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 30),
                                  child: Text(
                                    'Special Note(Optional)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RaleWay',
                                        fontSize: size),
                                  )),
                              Container(
                                width: fieldSize,
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintMaxLines: 10,
                                      border: OutlineInputBorder(),
                                      hintText:
                                          'Write comments in case you are allergic to ingredients or want to exclude some',
                                      icon: Icon(Icons.note)),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ]),
                        Column(children: <Widget>[
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: secondHorz, vertical: 70)),
                          Text(
                            'RM12.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RaleWay',
                                fontSize: size),
                          ),
                          Row(children: <Widget>[
                            _counter != 0
                                ? new IconButton(
                                    icon: new Icon(Icons.remove),
                                    onPressed: () => setState(() => _counter--),
                                  )
                                : new Container(),
                            new Text(_counter.toString()),
                            new IconButton(
                                icon: new Icon(Icons.add),
                                onPressed: () => setState(() => _counter++))
                          ]),
                          Container(
                            height: 35.0,
                            // ignore: deprecated_member_use
                            child: RaisedButton(
                              onPressed: () {showDialog(context: context,
                  builder: (BuildContext context){
                  return DialogBox(
                    title: "The product has been added to your cart",
                    descriptions: "1x\nRM 12.00\nCart subtotal: RM 12.00",
                    text: "View Cart", img:Image.asset(""), key: null,
                  );
                  }
                );},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(6.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 100.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Add to cart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ]),
                )
              ]))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        if (constraints.maxWidth > 1000) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pageChildren(constraints.biggest.width / 4, size, horz,
                  secondSize, secondHorz, fieldSize));
        } else if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width / 3.9, size - 7,
                horz / 1.4, secondSize, secondHorz, fieldSize),
          );
        } else if (constraints.maxWidth > 640) {
          return Row(
              children: pageChildren(
                  constraints.biggest.width / 3.6,
                  size - 9,
                  horz / 2.5,
                  secondSize - 1,
                  secondHorz / 1.3,
                  fieldSize - 90));
        } else if (constraints.maxWidth > 600) {
          return Row(
              children: pageChildren(
                  constraints.biggest.width / 3.7,
                  size - 11,
                  horz / 2.5,
                  secondSize - 2,
                  secondHorz / 1.8,
                  fieldSize - 80));
        } else if (constraints.maxWidth > 560) {
          return Row(
              children: pageChildren(
                  constraints.biggest.width / 3.8,
                  size - 13,
                  horz / 2.5,
                  secondSize - 3,
                  secondHorz / 1.9,
                  fieldSize - 80));
        } else {
          return Row(
            children: pageChildren(constraints.biggest.width / 3.8, size - 16,
                horz / 2.5, secondSize - 4, secondHorz / 3, fieldSize - 80),
          );
        }
      },
    );
  }
}
