import 'package:flutter/material.dart';

class SignUpVendorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      height: 130,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/vendorRegistration.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Vendor Registration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ]),
    );
  }
}
