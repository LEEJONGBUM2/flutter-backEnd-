import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconnexz/BBQChickenRicePage/Constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const DialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text,
      required this.img})
      : super(key: key);

  @override
  _DialogBox createState() => _DialogBox();
}

class _DialogBox extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
     double height = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Container(
          width: height/2,
          height: 360,
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(
                height: 0,
                thickness: 2,
              ),
              AutoSizeText(
                widget.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              SizedBox(
                height: 15,
              ),
              AutoSizeText(
                widget.descriptions,
                style: TextStyle(fontSize: 20),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ShoppingCart');
                    },
                    child: AutoSizeText(
                      widget.text,
                      style: TextStyle(fontSize: 20),
                      maxLines: 1,
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/ChickenRice/1.jpg")),
          ),
        ),
      ],
    );
  }
}
