import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class FAQBanner extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return
    Flexible(
     child:Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/FAQ.jfif"),
            fit: BoxFit.fill,
          ),
        ),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Column(mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
             Text(
             "FAQ(Frequently Asked Questions)",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: width/50,
               color: Colors.white
               ),
             ),
             ]
          ),
           ])));
  }
  }