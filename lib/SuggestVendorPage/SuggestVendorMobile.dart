import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/ActionButton/action_button.dart';
import 'package:iconnexz/widgets/ActionButton/action_signup_button.dart';

import 'package:iconnexz/widgets/Navbar/Navbar.dart';

class SuggestVendorMobile extends StatefulWidget {
  SuggestVendorMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SuggestVendorMobileState();
  }
}

class _SuggestVendorMobileState extends State<SuggestVendorMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ScrollController _controller;
  bool _showPassword = false;
  bool _showPassword1 = false;

  @override
  void initState() {
    //Initialize the  scrollController
    _controller = ScrollController();
    super.initState();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  @override
  Widget build(BuildContext context) {
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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Top section

          // Middle expanded
          Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Vendor Information",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.grey[700],
                        ),
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
                                : "Please Enter Vendor Name";
                          },
                          decoration: InputDecoration(
                            hintText: 'Ah Kow hicken Rice',
                            labelText: 'Vendor Name',
                            suffixIcon: Icon(
                              Icons.account_box_outlined,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        width: MediaQuery.of(context).size.width * 0.5,
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
                            WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: '60186613303',
                            labelText: 'HP Number',
                            suffixIcon: Icon(
                              Icons.phone_iphone_outlined,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                            WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: '603XXXXXXXX',
                            labelText: 'Tel Number',
                            suffixIcon: Icon(
                              Icons.add_ic_call_outlined,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.grey[700],
                        ),
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
                        width: MediaQuery.of(context).size.width * 0.5,
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
                            WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: '50490',
                            labelText: 'Postcode',
                            suffixIcon: Icon(
                              Icons.add_ic_call,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        width: MediaQuery.of(context).size.width * 0.5,
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
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(
                        height: 20,
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
                    ],
                  ),
                ))
              ])),
          //color: Colors.blueGrey[100],
          // Bottom Section
        ],
      ),
    );
  }
}
