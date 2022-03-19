import 'package:flutter/material.dart';

class CopyRightLogo extends StatelessWidget {
  final VoidCallback press;
  const CopyRightLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset(
        'images/copyright.png',
        height: 80,
        width: 80,
      ),
    );
  }
}
