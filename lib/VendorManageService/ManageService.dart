// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageService extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ManageService> {
  int navIndex = 2;
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
          SizedBox(height: defaultPadding),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 460,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                'Manage Service',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: text / 30, horizontal: text / 15),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/Service');
                                  }, // handle your image tap here
                                  child: Image.asset(
                                    'assets/images/Service.png',
                                    fit: BoxFit
                                        .fill, // this is the solution for border
                                    width: text / 5.5,
                                    height: text / 5.7,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: text / 8),
                                  child: Text(
                                    'Service',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: text / 60,
                                      color: Colors.white,
                                    ),
                                  ))
                            ],
                          ))
                    ]))
          ])
        ])));
  }
}
