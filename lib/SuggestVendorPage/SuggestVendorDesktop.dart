import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/ActionButton/action_back_button.dart';
import 'package:iconnexz/widgets/ActionButton/action_next_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

class SuggestVendorDesktop extends StatefulWidget {
  SuggestVendorDesktop({Key? key}) : super(key: key);

  @override
  _SuggestVendorDesktopState createState() => _SuggestVendorDesktopState();
}

class _SuggestVendorDesktopState extends State<SuggestVendorDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();
  //final ImagePicker _picker = ImagePicker();
  //final PickedFile? pickedFile = await picker.getImage(source: ImageSource.camera);
  //late PickedFile _image;
  //late File Photo_file;

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(children: [
                    Container(
                      width: 400,
                      alignment: Alignment(1.0, -1.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Vendor Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 30,
                              child: Divider(
                                color: Colors.pink,
                                //color: kPrimaryColor,
                                thickness: 4,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Invalid Field";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Ah Kow hicken Rice',
                                  labelText: 'Vendor Name',
                                  suffixIcon: Icon(
                                    Icons.account_box_outlined,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Owner Contract",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 30,
                              child: Divider(
                                color: Colors.pink,
                                //color: kPrimaryColor,
                                thickness: 4,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller1,
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Owner Name";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Lim Ah Kow',
                                  labelText: 'Owner Name',
                                  suffixIcon: Icon(
                                    Icons.accessibility,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller2,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter HP Number";
                                },
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      RegExp('[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '60186613303',
                                  labelText: 'HP Number',
                                  suffixIcon: Icon(
                                    Icons.phone_iphone_outlined,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller3,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Tel Number";
                                },
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      RegExp('[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '603XXXXXXXX',
                                  labelText: 'Tel Number',
                                  suffixIcon: Icon(
                                    Icons.add_ic_call_outlined,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller4,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Email Address";
                                },
                                decoration: InputDecoration(
                                  hintText: 'ahkow@gmail.com',
                                  labelText: 'Email Address',
                                  suffixIcon: Icon(
                                    Icons.mail_outline,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      width: 400,
                      alignment: Alignment(-0.8, -0.8),
                      child: SingleChildScrollView(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                  color: Colors.grey[700]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 30,
                              child: Divider(
                                color: Colors.pink,
                                //color: kPrimaryColor,
                                thickness: 4,
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller5,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Street";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Jalan Alor Street',
                                  labelText: 'Street',
                                  suffixIcon: Icon(
                                    Icons.add_road,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller6,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Postcode";
                                },
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      RegExp('[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: '50490',
                                  labelText: 'Postcode',
                                  suffixIcon: Icon(
                                    Icons.add_ic_call,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller7,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter City";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Kuala Lumpur',
                                  labelText: 'City',
                                  suffixIcon: Icon(
                                    Icons.emoji_transportation,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller8,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter State";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Damansara',
                                  labelText: 'State',
                                  suffixIcon: Icon(
                                    Icons.festival_outlined,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                controller: _controller9,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Country";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Malaysia',
                                  labelText: 'Country',
                                  suffixIcon: Icon(
                                    Icons.flight_outlined,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
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
                              child: GFButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      createSuggest(
                                          _controller.text,
                                          _controller1.text,
                                          int.parse(_controller2.text),
                                          int.parse(_controller3.text),
                                          _controller4.text,
                                          _controller5.text,
                                          int.parse(_controller6.text),
                                          _controller7.text,
                                          _controller8.text,
                                          _controller9.text);
                                    });
                                    Navigator.pushNamed(context, '/');
                                  }
                                },
                                color: GFColors.SUCCESS,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        }
      },
    );
  }
}
