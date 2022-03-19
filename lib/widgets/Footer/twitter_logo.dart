import 'package:flutter/material.dart';

class TwitterLogo extends StatelessWidget {
  final VoidCallback press;
  const TwitterLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/twitter.png',
        height: 40,
        width: 40,
      ),
    );
  }
}
