import 'package:flutter/material.dart';

class LinkOneLogo extends StatelessWidget {
  final VoidCallback press;
  const LinkOneLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/linkOne.png',
        height: 30,
        width: 30,
      ),
    );
  }
}
