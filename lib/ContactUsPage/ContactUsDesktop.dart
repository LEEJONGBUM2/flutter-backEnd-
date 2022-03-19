// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/ContactQModel.dart';
import 'package:iconnexz/widgets/ActionButton/action_back_button.dart';
import 'package:iconnexz/widgets/ActionButton/action_next_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart' show rootBundle;

class ContactUsDesktop extends StatefulWidget {
  ContactUsDesktop({Key? key}) : super(key: key);

  @override
  _ContactUsDesktopState createState() => _ContactUsDesktopState();
}

class _ContactUsDesktopState extends State<ContactUsDesktop> {
  List<ContactQ> _contactq = [];

  @override
  void initState() {
    fetchContactQ().then((value) {
      setState(() {
        _contactq.addAll(value);
      });
    });
    _controller = ScrollController();
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //final ImagePicker _picker = ImagePicker();
  //final PickedFile? pickedFile = await picker.getImage(source: ImageSource.camera);
  //late PickedFile _image;
  //late File Photo_file;
  final _controller0 = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  var search1;
  late ScrollController _controller;

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
                              "We are here to help",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //fontSize: width / 20,
                                  fontSize: 27,
                                  color: Colors.grey[700]),
                            ),
                            Text(
                              "We want to ensure that we are reachable to you whenevery you need help.\nreach us from any channel below at your convenience.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: width / 45,
                                  //fontSize: 17,
                                  color: Colors.black),
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
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 430,
                                    child: GFAccordion(
                                      title: _contactq[0].q1.toString(),
                                      // title: '24/7 Technical Support',
                                      content: _contactq[0].c1.toString(),
                                      //'Working Hour: 24 Hours & 7 days \nWhatsApp: 04-6097877 (Chat only) \nEmail: support@exabytes.my \nLive Chat: Chat Now \n\nWorking Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888'
                                    ),
                                  ),
                                  Container(
                                    width: 430,
                                    child: GFAccordion(
                                      title: _contactq[0].q2.toString(),
                                      // title: 'Sales Inquiries',
                                      content: _contactq[0].c2.toString(),
                                      //'Working Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888 \nWhatsApp: 04-6097877 (Chat only) \nEmail: sales@exabytes.my \nLive Chat: Chat Now \nor Consultation: Make Appointment Now'
                                    ),
                                  ),
                                  Container(
                                    width: 430,
                                    child: GFAccordion(
                                      title: _contactq[0].q3.toString(),
                                      // title: 'Billing Inquiries',
                                      content: _contactq[0].c3.toString(),
                                      // 'Working Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888 \nWhatsApp: 04-6097877 (Chat only) \nEmail: billing@exabytes.my \nLive Chat: Chat Now'
                                    ),
                                  ),
                                  Container(
                                    width: 430,
                                    child: GFAccordion(
                                      title: _contactq[0].q4.toString(),
                                      // title: 'Feedback',
                                      content: _contactq[0].c4.toString(),
                                      //  'Email: feedback@exabytes.my'
                                    ),
                                  ),
                                ]),
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
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "To*",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w100),
                                ),
                                Container(
                                  width: 400,
                                  child: DropdownSearch<String>(
                                      validator: (String? item) {
                                        if (item == null)
                                          return "Select A Department";
                                        else
                                          return null;
                                      },
                                      mode: Mode.MENU,
                                      showSelectedItem: true,
                                      items: [
                                        "Sales Department",
                                        "Technical Support Department",
                                        "Customer Service Department",
                                        "Billing Department",
                                        "Feedback",
                                      ],
                                      // onChanged: print,
                                      onChanged: (data) {
                                        search1 = data;
                                      }),
                                  //selectedItem: "Select A Department"
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _controller0,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Name";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  labelText: 'Name*',
                                  suffixIcon: Icon(
                                    Icons.account_circle,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _controller1,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Email";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email*',
                                  suffixIcon: Icon(
                                    Icons.alternate_email,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _controller2,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Subject";
                                },
                                decoration: InputDecoration(
                                  hintText: 'Subject',
                                  labelText: 'Subject*',
                                  suffixIcon: Icon(
                                    Icons.assessment,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _controller3,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Please Enter Contact Number";
                                },
                                inputFormatters: [
                                  WhitelistingTextInputFormatter(
                                      RegExp('[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: 'Contact Number',
                                  labelText: 'Contact Number*',
                                  suffixIcon: Icon(
                                    Icons.add_ic_call,
                                  ),
                                ),
                              ),
                              width: 400,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Message*",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 400,
                                    child: TextFormField(
                                      controller: _controller4,
                                      validator: (value) {
                                        return value!.isNotEmpty
                                            ? null
                                            : "Please Enter Any Message";
                                      },
                                      decoration: InputDecoration(
                                          hintMaxLines: 10,
                                          border: OutlineInputBorder(),
                                          hintText: 'Any Inquires',
                                          labelText: '',
                                          icon: Icon(Icons.note)),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                    ),
                                  ),
                                ]),
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
                                      createContact(
                                        search1,
                                        _controller0.text,
                                        _controller1.text,
                                        _controller2.text,
                                        int.parse(_controller3.text),
                                        _controller4.text,
                                      );
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
                            //actionButton("Sign Up"),
                            SizedBox(
                              height: 15,
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
    return ListView.builder(
      itemCount:
          _contactq == null ? 0 : (_contactq.length > 1 ? 1 : _contactq.length),
      shrinkWrap: true,
      // scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
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
      },
    );
  }
}
