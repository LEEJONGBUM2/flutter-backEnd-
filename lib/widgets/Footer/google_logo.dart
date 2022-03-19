import 'package:flutter/material.dart';

class GoogleLogo extends StatelessWidget {
  final VoidCallback press;
  const GoogleLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/google.png',
        height: 40,
        width: 40,
      ),
    );
  }
}
