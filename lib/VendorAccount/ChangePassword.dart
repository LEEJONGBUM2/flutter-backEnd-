import 'package:flutter/material.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => new _ChangePassword();
}

class _ChangePassword extends State<ChangePassword>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  int navIndex = 1;
  bool _showPassword = false;
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  final priceStart = TextEditingController();
  final priceEnd = TextEditingController();
  final thumbnail = TextEditingController();
  final thumbnail2 = TextEditingController();
  final _controller10 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  userName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      _controller10.text = prefs.getString("UserName")!;
    });
    print(_controller10.text);
  }

  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
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
                              Navigator.pushNamed(context, '/');
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: text / 1.24,
                                        height: 439,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20,
                                                                vertical: 20),
                                                        child: Text(
                                                            'Change New Password on Vendor',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize:
                                                                  text / 70,
                                                              color:
                                                                  Colors.white,
                                                            ))),
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    text / 7),
                                                        width: 1500,
                                                        child: Column(
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              new Card(
                                                                child:
                                                                    new ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .lock_outline),
                                                                  title:
                                                                      new TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      if ((value!.length >
                                                                              5) &&
                                                                          value
                                                                              .isNotEmpty) {
                                                                        return null;
                                                                      } else if ((value.length <=
                                                                              5) &&
                                                                          (value.length >=
                                                                              1)) {
                                                                        return "Please write down the password at least 6 digit or character";
                                                                      } else {
                                                                        return "Please Enter Current Password";
                                                                      }
                                                                    },
                                                                    obscureText:
                                                                        !_showPassword,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Current Password',
                                                                      labelText:
                                                                          'Current Password',
                                                                      suffixIcon:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _showPassword =
                                                                                !_showPassword;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          _showPassword
                                                                              ? Icons.visibility
                                                                              : Icons.visibility_off,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              new Card(
                                                                child:
                                                                    new ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .lock_outline),
                                                                  title:
                                                                      new TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      if ((value!.length >
                                                                              5) &&
                                                                          value
                                                                              .isNotEmpty) {
                                                                        return null;
                                                                      } else if ((value.length <=
                                                                              5) &&
                                                                          (value.length >=
                                                                              1)) {
                                                                        return "Please write down the password at least 6 digit or character";
                                                                      } else {
                                                                        return "Please Enter New Password";
                                                                      }
                                                                    },
                                                                    obscureText:
                                                                        !_showPassword1,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'New Password',
                                                                      labelText:
                                                                          'New Password',
                                                                      suffixIcon:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _showPassword1 =
                                                                                !_showPassword1;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          _showPassword1
                                                                              ? Icons.visibility
                                                                              : Icons.visibility_off,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              new Card(
                                                                child:
                                                                    new ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .password_outlined),
                                                                  title:
                                                                      new TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      if ((value!.length >
                                                                              5) &&
                                                                          value
                                                                              .isNotEmpty) {
                                                                        return null;
                                                                      } else if ((value.length <=
                                                                              5) &&
                                                                          (value.length >=
                                                                              1)) {
                                                                        return "Please write down the password at least 6 digit or character";
                                                                      } else {
                                                                        return "Please Enter Confirm Password";
                                                                      }
                                                                    },
                                                                    obscureText:
                                                                        !_showPassword2,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Confirm Password',
                                                                      labelText:
                                                                          'Confirm Password',
                                                                      suffixIcon:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _showPassword2 =
                                                                                !_showPassword2;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          _showPassword2
                                                                              ? Icons.visibility
                                                                              : Icons.visibility_off,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                  width: 230,
                                                                  child: Row(
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              30,
                                                                          // ignore: deprecated_member_use
                                                                          child:
                                                                              RaisedButton(
                                                                            onPressed:
                                                                                () {
                                                                              if (_formKey.currentState!.validate()) {
                                                                                ;
                                                                                Navigator.pushNamed(context, '/VendorAccountEdit');
                                                                              }
                                                                            },
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                            padding:
                                                                                EdgeInsets.all(0.0),
                                                                            child:
                                                                                Ink(
                                                                              decoration: BoxDecoration(color: Color(0xFF483D8B), borderRadius: BorderRadius.circular(6.0)),
                                                                              child: Container(
                                                                                  constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                                  alignment: Alignment.center,
                                                                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                    Icon(
                                                                                      Icons.check,
                                                                                      size: 25,
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      "Save",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                    ),
                                                                                  ])),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              30,
                                                                          // ignore: deprecated_member_use
                                                                          child:
                                                                              RaisedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pushNamed(context, '/VendorAccountEdit');
                                                                            },
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                            padding:
                                                                                EdgeInsets.all(0.0),
                                                                            child:
                                                                                Ink(
                                                                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
                                                                              child: Container(
                                                                                  constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                                  alignment: Alignment.center,
                                                                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                    Icon(
                                                                                      Icons.cancel,
                                                                                      size: 25,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      "Cancel",
                                                                                      textAlign: TextAlign.center,
                                                                                      style: TextStyle(color: Colors.black, fontSize: 15),
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
