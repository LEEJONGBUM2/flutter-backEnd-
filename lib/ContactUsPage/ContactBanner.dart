import 'package:flutter/material.dart';

class ContactBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/suggest.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
          ]),
    );
  }
}
