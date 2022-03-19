// ignore_for_file: deprecated_member_use, unused_field, unnecessary_new, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Balance.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Topup extends StatefulWidget {
  final Balance balance;
  
  const Topup({Key? key, required this.balance}) : super(key: key);
  @override
  _Topup createState() => _Topup();
}

class _Topup extends State<Topup> with SingleTickerProviderStateMixin {
  late final Balance balance;
  int navIndex = 6;
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final priceStart = TextEditingController();
  final _controller2 = TextEditingController();
  final priceEnd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller10 = TextEditingController();

 userName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
   setState(() {
            _controller10.text = prefs.getString("UserName")!;
          });
  print(_controller10.text);
}

  @override
  void initState() {
    balance = widget.balance;
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
     userName();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = new DateTime.now();
    double text = MediaQuery.of(context).size.width;
    int? _balance = balance.balance;
    int? total = 0;
    return Form(
      key: _formKey,
      child: Scaffold(
        drawer: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.0),
            child: AppBar(
              backgroundColor: Color(0xFF2A2D3E),
              actions: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white54,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white54,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {},
                        child: Text(_controller10.text),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(
                          Icons.power_settings_new,
                          color: Colors.white54,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                      ),
                    ]))
              ],
              leading: Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white54,
                      ),
                      onPressed: context.read<MenuController>().controlMenu,
                    ),
                  if (!Responsive.isMobile(context))
                    SizedBox(
                      width: 10,
                    ),
                  Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )),
        body: Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: SingleChildScrollView(
                controller: _scrollController,
                child: new Column(children: [
                  SizedBox(height: defaultPadding),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: text / 1.24,
                                height: 700,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child:
                                                    Text('Topup Account',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: text / 70,
                                                          color: Colors.white,
                                                        ))),
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: text / 7),
                                                width: 1500,
                                                child: Column(
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          leading: const Icon(
                                                              Icons.money),
                                                          title: new TextFormField(
                                                            controller: _controller2,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return value!.isNotEmpty
                        ? null
                        : "Please Enter Amount";
                  },
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp('[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    labelText: 'Amount',
                  ),
                ),
                                                        ),
                                                      ),
                                                       Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.monetization_on),
                                                                    title: DropdownSearch<
                                                                            String>(
                                                                        validator:
                                                                            (String?
                                                                                item) {
                                                                          if (item ==
                                                                              null)
                                                                            return "Select Payment Gateway";
                                                                          else
                                                                            return null;
                                                                        },
                                                                        mode: Mode
                                                                            .MENU,
                                                                        showSelectedItem:
                                                                            true,
                                                                        items: [
                                                                          "RHB Online Banking",
                                                                          "CIMB Online Banking",
                                                                          "Maybank Online Banking"
                                                                        ],
                                                                        onChanged: (data)
                                                                        {
                                                                           data;
                                                                        }),
                                                                  ),
                                                                ),
                                                      SizedBox(height: 10),
                                                      Container(
                                                          width: 230,
                                                          child: Row(children: [
                                                            Container(
                                                              width: 100,
                                                              height: 30,
                                                              // ignore: deprecated_member_use
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () {
                                                                  if (_formKey.currentState!.validate()) {
                                                                    total = (_balance! + int.parse(_controller2.text));
                                                                    setState(() {
                                                                                  updateBalance(
                                                                                  balance.balanceId,
                                                                                  total,
                                                                                  _controller10.text);
                                                                                  createTransaction(
                                                                                   int.parse(_controller2.text),
                                                                                   _controller10.text,
                                                                                   date.toString(),
                                                                                    "Topup",
                                                                                  _controller10.text);
                                                                                });
                                                                  Navigator.pushNamed(context, '/Wallet');
                                                                      }
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0)),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Ink(
                                                                  decoration: BoxDecoration(
                                                                      color: Color(
                                                                          0xFF483D8B),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0)),
                                                                  child: Container(
                                                                      constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                      alignment: Alignment.center,
                                                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                        Icon(
                                                                          Icons
                                                                              .check,
                                                                          size:
                                                                              25,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Topup",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 15),
                                                                        ),
                                                                      ])),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Container(
                                                              width: 100,
                                                              height: 30,
                                                              // ignore: deprecated_member_use
                                                              child:
                                                                  RaisedButton(
                                                                onPressed: () {
                                                                 Navigator.pushNamed(context, '/Wallet');
                                                                },
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0)),
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                child: Ink(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0)),
                                                                  child: Container(
                                                                      constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                      alignment: Alignment.center,
                                                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                        Icon(
                                                                          Icons
                                                                              .cancel,
                                                                          size:
                                                                              25,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Text(
                                                                          "Cancel",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 15),
                                                                        ),
                                                                      ])),
                                                                ),
                                                              ),
                                                            ),
                                                          ]))
                                                    ])),
                                          ])
                                    ]))
                          ],
                        ))
                  ])
                ])))));
  }
}
