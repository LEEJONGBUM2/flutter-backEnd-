import 'package:flutter/material.dart';

Widget actionButton(String text) {
  return Container(
    height: 50,
    width: 280,
    //width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.pink,
      //color: kPrimaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.pink.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
