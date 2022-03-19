import 'package:flutter/material.dart';

class SignUpBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      height: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Registration.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
