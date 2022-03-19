import 'package:flutter/material.dart';

class LinkTwoLogo extends StatelessWidget {
  final VoidCallback press;
  const LinkTwoLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/linkTwo.png',
        height: 50,
        width: 50,
      ),
    );
  }
}
