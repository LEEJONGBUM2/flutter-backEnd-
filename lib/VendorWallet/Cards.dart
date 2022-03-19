// ignore_for_file: duplicate_import, file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/CardsModel.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:iconnexz/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cardss extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Cardss> {
  int navIndex = 5;
  List<Cards> _cards = [];
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
    fetchCards().then((value) {
      setState(() {
        _cards.addAll(value);
      });
    });
    super.initState();
     userName();
  }

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: ListView.builder(
          itemCount: _cards == null
                    ? 0
                    : (_cards.length > 1 ? 1 : _cards.length),
           itemBuilder: (context, index) {
                                            return new Column(children: [
                  SizedBox(height: defaultPadding),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: double.infinity,
                                child: DraggableScrollableSheet(
                                  builder: (context, scrollController) {
                                    return Container(
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        "Your Cards",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 24,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Text(
                                                        "2 Physical Card, and 1 Virtual Card",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w900,
                                                            fontSize: 14,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.more_horiz,
                                                      color:
                                                          Colors.lightBlue[900],
                                                      size: 30,
                                                    ),
                                                    onPressed: () {},
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32),
                                            ),

                                            SizedBox(
                                              height: 16,
                                            ),

                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32),
                                              child: Row(
                                                children: <Widget>[
                                                  //copy same button
                                                  Container(
                                                    child: Text(
                                                      "Physical Card",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color:
                                                              Colors.grey[900]),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 10.0,
                                                              spreadRadius: 4.5)
                                                        ]),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                  ),

                                                  SizedBox(
                                                    width: 16,
                                                  ),

                                                  Container(
                                                    child: Text(
                                                      "Virtual Card",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color:
                                                              Colors.grey[900]),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 10.0,
                                                              spreadRadius: 4.5)
                                                        ]),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20,
                                                            vertical: 10),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            //Container for card
                                            SizedBox(
                                              height: 16,
                                            ),

                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 32),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Color.fromRGBO(
                                                      35, 60, 103, 1),
                                                ),
                                                padding: EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                          radius: 16,
                                                          backgroundColor:
                                                              Color.fromRGBO(50,
                                                                  172, 121, 1),
                                                          child: Icon(
                                                            Icons.check,
                                                            color: Colors.white,
                                                            size: 24,
                                                          ),
                                                        ),
                                                        Text(
                                                          _cards[index].cardType.toString(),
                                                          style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontSize: 28,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 32,
                                                    ),
                                                    Text(
                                                      _cards[index].virtualCardNumber.toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: 2.0),
                                                    ),
                                                    SizedBox(
                                                      height: 32,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              "CARD HOLDER",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                            Text(
                                                              _controller10.text,
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              "EXPIRES",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                            Text(
                                                              _cards[index].expiry.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Text(
                                                              "CVV",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .blue,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                            Text(
                                                              _cards[index].cvv.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  letterSpacing:
                                                                      2.0),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )),

                                            SizedBox(
                                              height: 16,
                                            ),

                                            Container(
                                              child: Text(
                                                "Card Settings",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 32),
                                            ),

                                            SizedBox(
                                              height: 16,
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: 10.0,
                                                        blurRadius: 4.5)
                                                  ]),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 4),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 32),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.wifi_tethering,
                                                        color: Colors
                                                            .lightBlue[900],
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Text(
                                                        "Card Settings",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey[700]),
                                                      )
                                                    ],
                                                  ),
                                                  Switch(
                                                    value: true,
                                                    activeColor: Color.fromRGBO(
                                                        50, 172, 121, 1),
                                                    onChanged: (_) {},
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: 10.0,
                                                        blurRadius: 4.5)
                                                  ]),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 4),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 32),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.credit_card,
                                                        color: Colors
                                                            .lightBlue[900],
                                                      ),
                                                      SizedBox(
                                                        width: 16,
                                                      ),
                                                      Text(
                                                        "Online Payment",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 18,
                                                            color: Colors
                                                                .grey[700]),
                                                      )
                                                    ],
                                                  ),
                                                  Switch(
                                                    value: false,
                                                    activeColor: Color.fromRGBO(
                                                        50, 172, 121, 1),
                                                    onChanged: (_) {},
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(243, 245, 248, 1),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40))),
                                    );
                                  },
                                  initialChildSize: 0.95,
                                  maxChildSize: 0.95,
                                ),
                              )
                            ]))
                  ])
                ]);}));
  }
}
