// ignore_for_file: avoid_unnecessary_containers, file_names, unnecessary_new, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Balance.dart';
import 'package:iconnexz/Models/Transactions.dart';
import 'package:iconnexz/VendorWallet/MainScreenSend.dart';
import 'package:iconnexz/VendorWallet/MainScreenTopup.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/responsive.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wallet extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Wallet> {
  int navIndex = 5;
  List<Transactions> _transactions = [];
  List<Balance> _balance = [];
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
    fetchTransactions().then((value) {
      setState(() {
        _transactions.addAll(value);
      });
    });
    fetchBalance().then((value) {
      setState(() {
        _balance.addAll(value);
      });
    });
    super.initState();
     userName();
  }

  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
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
          itemCount: _balance == null
                    ? 0
                    : (_balance.length > 1 ? 1 : _balance.length),
          itemBuilder: (context, index) {
            return SingleChildScrollView(
            child: new Column(children: [
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
                        child: Stack(
                          children: <Widget>[
                            //Container for top data
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: text / 60, vertical: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'My Wallet',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.w700),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                            text: 'RM ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 34,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          TextSpan(
                                            text:
                                                _balance[0].balance.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 34,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ]),
                                      ),
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            243, 245, 248, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    18))),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.credit_card,
                                                        color: Colors.blue[900],
                                                        size: 30,
                                                      ),
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context, '/Cards');
                                                      },
                                                    ),
                                                    padding: EdgeInsets.all(12),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "Check\nCard",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blue[100]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: text / 250,
                                            ),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            243, 245, 248, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    18))),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.money_off,
                                                        color: Colors.blue[900],
                                                        size: 30,
                                                      ),
                                                      onTap: () {
                                                        OneContext().pushReplacement(MaterialPageRoute(builder: (_) => MultiProvider(
                                          providers: [
                                            ChangeNotifierProvider(
                                              create: (context) =>
                                                  MenuController(),
                                            ),
                                          ],
                                          child: MainScreenSend(
                                            balance: _balance[index],
                                          ),
                                        ),));
                                                      },
                                                    ),
                                                    padding: EdgeInsets.all(12),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "Send\nPay",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blue[100]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: text / 250,
                                            ),
                                            Container(
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            243, 245, 248, 1),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    18))),
                                                    child: InkWell(
                                                      child: Icon(
                                                        Icons.attach_money,
                                                        color: Colors.blue[900],
                                                        size: 30,
                                                      ),
                                                      onTap: () {
                                                      OneContext().pushReplacement(MaterialPageRoute(builder: (_) => MultiProvider(
                                          providers: [
                                            ChangeNotifierProvider(
                                              create: (context) =>
                                                  MenuController(),
                                            ),
                                          ],
                                          child: MainScreenTopup(
                                            balance: _balance[index],
                                          ),
                                        ),));
                                                      },
                                                    ),
                                                    padding: EdgeInsets.all(12),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    "Topup\nReload",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blue[100]),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Available Balance",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.blue[100]),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),

                            //draggable sheet
                            DraggableScrollableSheet(
                              builder: (context, scrollController) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(243, 245, 248, 1),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(40),
                                          topRight: Radius.circular(40))),
                                  child: SingleChildScrollView(
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
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Recent Transactions",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 24,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "See all",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                    color: Colors.grey[800]),
                                              )
                                            ],
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 32),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),

                                        //Container for buttons
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: text / 40),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                child: Text(
                                                  "All",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                      color: Colors.grey[900]),
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 10.0,
                                                          spreadRadius: 4.5)
                                                    ]),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),
                                        //Container Listview for expenses and incomes
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 32),
                                        ),

                                        SizedBox(
                                          height: 16,
                                        ),

                                        ListView.builder(
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 32),
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[100],
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    18))),
                                                    child: Icon(
                                                      Icons.money,
                                                      color:
                                                          Colors.lightBlue[900],
                                                    ),
                                                    padding: EdgeInsets.all(12),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          _transactions[index]
                                                              .reason
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors
                                                                  .grey[900]),
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'From: ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                              .grey[
                                                                          500]),
                                                                ),
                                                                TextSpan(
                                                                  text: _transactions[
                                                                          index]
                                                                      .vendor
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                              .grey[
                                                                          500]),
                                                                ),
                                                                 TextSpan(
                                                                  text: ' | To: ',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                              .grey[
                                                                          500]),
                                                                ),
                                                                TextSpan(
                                                                  text: _transactions[
                                                                          index]
                                                                      .username
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                              .grey[
                                                                          500]),
                                                                )
                                                              ]),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: <Widget>[
                                                      RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text: 'RM ',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          TextSpan(
                                                            text: _transactions[
                                                                    index]
                                                                .amount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ]),
                                                      ),
                                                      Text(
                                                        _transactions[index]
                                                            .date
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors
                                                                .grey[500]),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: _transactions.length,
                                          padding: EdgeInsets.all(0),
                                          controller: ScrollController(
                                              keepScrollOffset: false),
                                        ),
                                      ],
                                    ),
                                    controller: scrollController,
                                  ),
                                );
                              },
                              initialChildSize: 0.65,
                              minChildSize: 0.65,
                              maxChildSize: 1,
                            )
                          ],
                        ),
                      )
                    ]))
          ])
        ]));}));
  }
}
