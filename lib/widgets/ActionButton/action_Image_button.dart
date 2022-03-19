import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';

class ActionImageButton extends StatelessWidget {
  const ActionImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 280,
      //width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pink,
        //color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        padding: EdgeInsets.all(0.0),
        onPressed: () {},
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff2555be), Color(0xff2625be)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(6.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: 90.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Select the file",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
