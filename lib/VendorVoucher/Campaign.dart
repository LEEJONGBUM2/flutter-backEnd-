// ignore_for_file: deprecated_member_use, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore, unnecessary_new
import 'dart:convert';
import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Campaign extends StatefulWidget {
  @override
  _Campaign createState() => new _Campaign();
}

class _Campaign extends State<Campaign> with SingleTickerProviderStateMixin {
  int navIndex = 6;
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final priceStart = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller10 = TextEditingController();
  final priceEnd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PlatformFile? objFile = null;

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
    _controller = new TabController(length: 3, vsync: this);
    userName();
  }

  void chooseFileUsingFilePicker() async {
    //-----pick file by file picker,

    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png'],
      type: FileType.custom,
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  void uploadSelectedFile() async {
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("https://172.30.1.10:45455/api/ImageModels"),
      //  Uri.parse("https://192.168.1.106:45455/api/ImageModels"),
    );
    // ignore: unnecessary_new
    request.files.add(new http.MultipartFile(
        "fileobj", objFile!.readStream!, objFile!.size,
        filename: objFile!.name));

    //-------Send request
    var resp = await request.send();

    //------Read response
    String result = await resp.stream.bytesToString();

    //-------Your response
    print(result);
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
                                        height: 700,
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
                                                            'Create New Campaign',
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
                                                                              .campaign),
                                                                  title:
                                                                      new TextFormField(
                                                                    controller:
                                                                        _controller1,
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter campaign name';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    decoration: const InputDecoration(
                                                                        hintText:
                                                                            'Campaign Name'),
                                                                  ),
                                                                ),
                                                              ),
                                                              new Card(
                                                                child:
                                                                    new ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .calendar_today),
                                                                  title:
                                                                      new TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter start date';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    readOnly:
                                                                        true,
                                                                    controller:
                                                                        priceStart,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            'Start Date'),
                                                                    onTap:
                                                                        () async {
                                                                      var date = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime(
                                                                              1900),
                                                                          lastDate:
                                                                              DateTime(2100));
                                                                      priceStart.text = date
                                                                          .toString()
                                                                          .substring(
                                                                              0,
                                                                              10);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              new Card(
                                                                child:
                                                                    new ListTile(
                                                                  leading:
                                                                      const Icon(
                                                                          Icons
                                                                              .calendar_today),
                                                                  title:
                                                                      new TextFormField(
                                                                    validator:
                                                                        (value) {
                                                                      if (value ==
                                                                              null ||
                                                                          value
                                                                              .isEmpty) {
                                                                        return 'Please enter end date';
                                                                      }
                                                                      return null;
                                                                    },
                                                                    readOnly:
                                                                        true,
                                                                    controller:
                                                                        priceEnd,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            'End Date'),
                                                                    onTap:
                                                                        () async {
                                                                      var date = await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime(
                                                                              1900),
                                                                          lastDate:
                                                                              DateTime(2100));
                                                                      priceEnd.text = date
                                                                          .toString()
                                                                          .substring(
                                                                              0,
                                                                              10);
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                              Card(
                                                                child: Column(
                                                                  children: [
                                                                    //------Button to choose file using file picker plugin
                                                                    RaisedButton(
                                                                        child: Text(
                                                                            "Choose Campaign Image"),
                                                                        onPressed:
                                                                            () =>
                                                                                chooseFileUsingFilePicker()),
                                                                    //------Show file name when file is selected
                                                                    if (objFile !=
                                                                        null)
                                                                      Text(
                                                                          "File name : ${objFile!.name}"),
                                                                    //------Show file size when file is selected
                                                                    if (objFile !=
                                                                        null)
                                                                      Text(
                                                                          "File size : ${objFile!.size} bytes"),
                                                                    //------Show upload utton when file is selected
                                                                  ],
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
                                                                                setState(() {
                                                                                  uploadSelectedFile();
                                                                                  createCampaign(_controller1.text, priceStart.text, priceEnd.text, _controller10.text);
                                                                                });
                                                                                Navigator.pushNamed(context, '/Voucher');
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
                                                                                  // ignore: prefer_const_literals_to_create_immutables
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
                                                                              Navigator.pushNamed(context, '/Voucher');
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
