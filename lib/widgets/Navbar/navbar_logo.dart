import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  final VoidCallback press;
  const NavBarLogo({Key? key, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Image.asset('assets/images/Iconnexz.png', height: 83,
      width: 271),
    );
  }
}