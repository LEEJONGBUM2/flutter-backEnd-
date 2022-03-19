import 'package:flutter/material.dart';

class FacebookLogo extends StatelessWidget {
  final VoidCallback press;
  const FacebookLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/facebook.png',
        height: 40,
        width: 40,
      ),
    );
  }
}
