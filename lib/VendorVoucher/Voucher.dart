// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new

import 'package:flutter/material.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Voucher extends StatefulWidget {
  @override
  _Voucher createState() => _Voucher();
}

class _Voucher extends State<Voucher> {
  int navIndex = 6;
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
    super.initState();
    userName();
  }
  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        body: SingleChildScrollView(
            child: new Column(children: [
          const SizedBox(height: defaultPadding),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: text / 1.24,
                        height: 400,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: text / 400),
                                    Text('Campaign',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: text / 70,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: text / 1.65),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: text / 50),
                                          Container(
                                            width: text / 8.4,
                                            height: text / 50,
                                            // ignore: deprecated_member_use
                                            child: RaisedButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/Campaign');
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0)),
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF483D8B),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0)),
                                                child: Container(
                                                    constraints: BoxConstraints(
                                                        maxWidth: text / 8.2,
                                                        minHeight: text / 6.2),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            size: text / 60,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width: text / 400,
                                                          ),
                                                          Text(
                                                            "Add Campaign",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    text / 90),
                                                          ),
                                                        ])),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: text / 140,
                                          )
                                        ])
                                  ]),
                              Divider(
                                height: 0,
                                thickness: 0,
                                indent: 0,
                                endIndent: 0,
                                color: Colors.white,
                              ),
                            ]))
                  ],
                ))
          ])
        ])));
  }
}
