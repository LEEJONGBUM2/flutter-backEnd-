import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendorPage.dart';

class VendorBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.symmetric(vertical: width / 50),
        height: width / 5.8,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/laptop.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(width: width / 5),
          Column(children: <Widget>[
            Text(
              "You bring the skill.\nWe'll make the earning easier.",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width / 50,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(children: <Widget>[
              Container(
                height: width / 30,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/SignupsVendor');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffF4A460), Color(0xffFF69B4)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: width / 6, minHeight: width / 6),
                      alignment: Alignment.center,
                      child: Text(
                        "BECOME A VENDOR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontSize: width / 100),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width / 8)
            ]),
          ])
        ]));
  }
}
