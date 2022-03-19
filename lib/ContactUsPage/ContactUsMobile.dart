import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/ActionButton/action_button.dart';
import 'package:iconnexz/widgets/ActionButton/action_signup_button.dart';

import 'package:iconnexz/widgets/Navbar/Navbar.dart';

class ContactUsMobile extends StatefulWidget {
  ContactUsMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContactUsMobileState();
  }
}

class _ContactUsMobileState extends State<ContactUsMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller0 = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();
  var search1;
  late ScrollController _controller;

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
                        "We are here to help",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        "We want to ensure that we are reachable to you whenevery you need help.\nreach us from any channel below at your convenience.",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 8,
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
                              width: 300,
                              child: GFAccordion(
                                  title: '24/7 Technical Support',
                                  content:
                                      'Working Hour: 24 Hours & 7 days \nWhatsApp: 04-6097877 (Chat only) \nEmail: support@exabytes.my \nLive Chat: Chat Now \n\nWorking Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888'),
                            ),
                            Container(
                              width: 300,
                              child: GFAccordion(
                                  title: 'Sales Inquiries',
                                  content:
                                      'Working Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888 \nWhatsApp: 04-6097877 (Chat only) \nEmail: sales@exabytes.my \nLive Chat: Chat Now \nor Consultation: Make Appointment Now'),
                            ),
                            Container(
                              width: 300,
                              child: GFAccordion(
                                  title: 'Billing Inquiries',
                                  content:
                                      'Working Hour: 9.00am – 5.00pm GMT +0800 (MON – FRI) \nPhone Support: 04-6097888 \nWhatsApp: 04-6097877 (Chat only) \nEmail: billing@exabytes.my \nLive Chat: Chat Now'),
                            ),
                            Container(
                              width: 300,
                              child: GFAccordion(
                                  title: 'Feedback',
                                  content: 'Email: feedback@exabytes.my'),
                            ),
                          ]),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "To*",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w100),
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
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Name";
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                            labelText: 'Name*',
                            suffixIcon: Icon(
                              Icons.account_circle,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          controller: _controller6,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Email";
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email*',
                            suffixIcon: Icon(
                              Icons.account_circle,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Subject";
                          },
                          controller: _controller7,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Subject',
                            labelText: 'Subject*',
                            suffixIcon: Icon(
                              Icons.assessment,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          controller: _controller8,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Contact Number";
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Contact Number',
                            labelText: 'Contact Number*',
                            suffixIcon: Icon(
                              Icons.add_ic_call,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Message*",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w100),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: 260,
                              child: TextFormField(
                                controller: _controller9,
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
                            SizedBox(
                              height: 10,
                            ),
                          ]),
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
