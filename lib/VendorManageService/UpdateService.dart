// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Service.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateService extends StatefulWidget {
  final Service service;

  const UpdateService({Key? key, required this.service}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UpdateService>
    with SingleTickerProviderStateMixin {
  late final Service service;
  int navIndex = 2;
  bool isChecked = false;
  bool isChecked2 = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  DateTime? date1;
  DateTime? date2;
  final _controller6 = TextEditingController();
  PlatformFile? objFile = null;
  // ignore: prefer_typing_uninitialized_variables
  var search;
  var search2;
  var search3;
  var data;
  var data2;
  PlatformFile? objFile2 = null;
  final priceStart = TextEditingController();
  final priceEnd = TextEditingController();
  // final thumbnail = TextEditingController();
  // final thumbnail2 = TextEditingController();
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
    service = widget.service;
    super.initState();
    _controller = TabController(length: 3, vsync: this);
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

  void chooseFileUsingFilePicker2() async {
    //-----pick file by file picker,

    var result2 = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png'],
      type: FileType.custom,
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result2 != null) {
      setState(() {
        objFile2 = result2.files.single;
      });
    }
  }

  void uploadSelectedFile() async {
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("https://172.30.1.10:45455/api/ServiceImageModels"),
      // Uri.parse("https://192.168.1.106:45455/api/ServiceImageModels"),
    );
    // ignore: unnecessary_new
    request.files.add(new http.MultipartFile(
        "fileobj", objFile!.readStream!, objFile!.size,
        filename: objFile!.name));
    // ignore: unnecessary_new
    request.files.add(new http.MultipartFile(
        "fileobj2", objFile2!.readStream!, objFile2!.size,
        filename: objFile2!.name));

    //-------Send request
    var resp = await request.send();

    //------Read response
    String result = await resp.stream.bytesToString();

    //-------Your response
    print(result);
  }

  // _openImageFile(BuildContext context) async {
  //   final XTypeGroup typeGroup = XTypeGroup(
  //     label: 'images',
  //     extensions: ['jpg', 'png'],
  //   );
  //   final List<XFile> files = await openFiles(acceptedTypeGroups: [typeGroup]);
  //   if (files.isEmpty) {
  //     // Operation was canceled by the user.
  //     return;
  //   }
  //   final XFile file = files[0];
  //   return file.name;
  // }

  // _openImagesFile(BuildContext context) async {
  //   final XTypeGroup jpgsTypeGroup = XTypeGroup(
  //     label: 'JPEGs',
  //     extensions: ['jpg', 'jpeg'],
  //   );
  //   final XTypeGroup pngTypeGroup = XTypeGroup(
  //     label: 'PNGs',
  //     extensions: ['png'],
  //   );
  //   final List<XFile> files = await openFiles(acceptedTypeGroups: [
  //     jpgsTypeGroup,
  //     pngTypeGroup,
  //   ]);
  //   if (files.isEmpty) {
  //     // Operation was canceled by the user.
  //     return;
  //   }
  //   return [files.length.toString(), "files"];
  // }

  @override
  Widget build(BuildContext context) {
    _controller1.text = service.serviceName.toString();
    _controller2.text = service.serviceDescription.toString();
    _controller3.text = service.ssu.toString();
    _controller4.text = service.servicePrice.toString();
    _controller5.text = service.stock.toString();
    _controller6.text = service.serviceSpecialPrice.toString();
    priceStart.text = service.specialPriceStart.toString();
    priceEnd.text = service.specialPriceEnd.toString();
    double text = MediaQuery.of(context).size.width;
    double text2 = MediaQuery.of(context).size.height;
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
                    child: Column(children: [
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
                                        height: 1300,
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
                                                            'Update Service',
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
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xFF483D8B)),
                                                      child: TabBar(
                                                        controller: _controller,
                                                        tabs: [
                                                          Tab(
                                                            icon: const Icon(
                                                                Icons.info),
                                                            text:
                                                                'General Information',
                                                          ),
                                                          Tab(
                                                            icon: const Icon(Icons
                                                                .design_services),
                                                            text:
                                                                'Service Variations',
                                                          ),
                                                          Tab(
                                                            icon: const Icon(Icons
                                                                .my_location),
                                                            text:
                                                                'Service Mapping',
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 1100.0,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  text / 10),
                                                      child: TabBarView(
                                                        controller: _controller,
                                                        children: <Widget>[
                                                          Container(
                                                              child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.list),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller1,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter service name';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'Service Name'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.description),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller2,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter service description';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'Service Description'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.add_chart),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller3,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter ssu';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'SSU'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.price_change_outlined),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller4,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter service price';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'Service Price*'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.production_quantity_limits),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller5,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter stock';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: [
                                                                        WhitelistingTextInputFormatter(
                                                                            RegExp("[0-9]")),
                                                                      ],
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'Stock*'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.privacy_tip),
                                                                    title:
                                                                        TextFormField(
                                                                      controller:
                                                                          _controller6,
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter service special price';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      decoration:
                                                                          const InputDecoration(
                                                                              hintText: 'Service Special Price'),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.calendar_today),
                                                                    title:
                                                                        TextFormField(
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter special price start';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      readOnly:
                                                                          true,
                                                                      controller:
                                                                          priceStart,
                                                                      decoration:
                                                                          InputDecoration(
                                                                              hintText: 'Special Price Start'),
                                                                      onTap:
                                                                          () async {
                                                                        date1 = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                DateTime.now(),
                                                                            firstDate: DateTime(1900),
                                                                            lastDate: DateTime(2100));
                                                                        priceStart.text = date1
                                                                            .toString()
                                                                            .substring(0,
                                                                                10);
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                                Card(
                                                                  child:
                                                                      ListTile(
                                                                    leading:
                                                                        const Icon(
                                                                            Icons.calendar_today),
                                                                    title:
                                                                        TextFormField(
                                                                      validator:
                                                                          (value) {
                                                                        if (value ==
                                                                                null ||
                                                                            value.isEmpty) {
                                                                          return 'Please enter special price end';
                                                                        }
                                                                        return null;
                                                                      },
                                                                      readOnly:
                                                                          true,
                                                                      controller:
                                                                          priceEnd,
                                                                      decoration:
                                                                          InputDecoration(
                                                                              hintText: 'Special Price End'),
                                                                      onTap:
                                                                          () async {
                                                                        date2 = await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                DateTime.now(),
                                                                            firstDate: DateTime(1900),
                                                                            lastDate: DateTime(2100));
                                                                        priceEnd.text = date2
                                                                            .toString()
                                                                            .substring(0,
                                                                                10);
                                                                      },
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
                                                                            return "Select Tax Class";
                                                                          else
                                                                            return null;
                                                                        },
                                                                        hint:
                                                                            "Select Tax Class",
                                                                        mode: Mode
                                                                            .MENU,
                                                                        showSelectedItem:
                                                                            true,
                                                                        items: [
                                                                          "Standard VAT"
                                                                        ],
                                                                        onChanged:
                                                                            (data) {
                                                                          search =
                                                                              data;
                                                                        }),
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
                                                                            return "is Published?";
                                                                          else
                                                                            return null;
                                                                        },
                                                                        hint:
                                                                            "is Published?",
                                                                        mode: Mode
                                                                            .MENU,
                                                                        showSelectedItem:
                                                                            true,
                                                                        items: [
                                                                          "true",
                                                                          "false"
                                                                        ],
                                                                        onChanged:
                                                                            (data2) {
                                                                          search3 =
                                                                              data2;
                                                                        }),
                                                                  ),
                                                                ),

                                                                // Card(
                                                                //   child:
                                                                //       ListTile(
                                                                //     leading:
                                                                //         const Icon(
                                                                //             Icons.add_a_photo),
                                                                //     title:
                                                                //         TextFormField(
                                                                //       validator:
                                                                //           (value) {
                                                                //         if (value ==
                                                                //                 null ||
                                                                //             value.isEmpty) {
                                                                //           return 'Please enter thumbnail image';
                                                                //         }
                                                                //         return null;
                                                                //       },
                                                                //       readOnly:
                                                                //           true,
                                                                //       controller:
                                                                //           thumbnail,
                                                                //       decoration:
                                                                //           InputDecoration(
                                                                //               hintText: 'Select Thumbnail'),
                                                                //       onTap:
                                                                //           () async {
                                                                //         var date =
                                                                //             await _openImageFile(context);
                                                                //         thumbnail.text =
                                                                //             date.toString();
                                                                //       },
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                                // Card(
                                                                //   child:
                                                                //       ListTile(
                                                                //     leading:
                                                                //         const Icon(
                                                                //             Icons.add_a_photo_sharp),
                                                                //     title:
                                                                //         TextFormField(
                                                                //       validator:
                                                                //           (value) {
                                                                //         if (value ==
                                                                //                 null ||
                                                                //             value.isEmpty) {
                                                                //           return 'Please enter service Image';
                                                                //         }
                                                                //         return null;
                                                                //       },
                                                                //       readOnly:
                                                                //           true,
                                                                //       controller:
                                                                //           thumbnail2,
                                                                //       decoration:
                                                                //           InputDecoration(
                                                                //               hintText: 'Select Service Images'),
                                                                //       onTap:
                                                                //           () async {
                                                                //         var date =
                                                                //             await _openImagesFile(context);
                                                                //         thumbnail2.text =
                                                                //             date.toString();
                                                                //       },
                                                                //     ),
                                                                //   ),
                                                                // ),
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
                                                                              onPressed: () {
                                                                                if (_formKey.currentState!.validate()) {
                                                                                  setState(() {
                                                                                    updateService(service.serviceId, _controller1.text, _controller2.text, _controller3.text, _controller4.text, int.parse(_controller5.text), _controller6.text, priceStart.text, priceEnd.text, search, search3, service.vendor.toString());
                                                                                  });
                                                                                  showAlertDialog(context);
                                                                                }
                                                                                //   createService(
                                                                                //       _controller1.text,
                                                                                //       int.parse(_controller2.text),
                                                                                //       _controller3.text,
                                                                                //       _controller4.text,
                                                                                //       _controller5.text,
                                                                                //       _controller6.text,
                                                                                //       int.parse(_controller7.text),
                                                                                //       _controller8.text,
                                                                                //       _controller9.text,
                                                                                //       _controller10.text);
                                                                                // });
                                                                              },
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                              padding: EdgeInsets.all(0.0),
                                                                              child: Ink(
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
                                                                                        "Update",
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
                                                                              onPressed: () {
                                                                                Navigator.pushNamed(context, '/Service');
                                                                              },
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                              padding: EdgeInsets.all(0.0),
                                                                              child: Ink(
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
                                                          Container(
                                                              child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Card(
                                                                    child: ListTile(
                                                                        leading: Text("Available Options"),
                                                                        title: DropdownSearch<String>(
                                                                            validator: (String? item) {
                                                                              if (item == null)
                                                                                return "Select Option";
                                                                              else
                                                                                return null;
                                                                            },
                                                                            mode: Mode.MENU,
                                                                            showSelectedItem: true,
                                                                            items: ["Business", "Eateries", "Services"],
                                                                            onChanged: (data2) {
                                                                              search2 = data2;
                                                                            }))),
                                                                SizedBox(
                                                                    height: 5),
                                                                Container(
                                                                  width: 150,
                                                                  height: 30,
                                                                  // ignore: deprecated_member_use
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed:
                                                                        () {
                                                                      if (_formKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        setState(
                                                                            () {
                                                                          updateServiceVariation(
                                                                              service.serviceId,
                                                                              search2,
                                                                              "Shahryar",
                                                                              "Added");
                                                                        });
                                                                        showAlertDialog2(
                                                                            context);
                                                                      }
                                                                    },
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(6.0)),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            0.0),
                                                                    child: Ink(
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      child: Container(
                                                                          constraints: BoxConstraints(maxWidth: 150, minHeight: 10),
                                                                          alignment: Alignment.center,
                                                                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                            Icon(
                                                                              Icons.add,
                                                                              size: 25,
                                                                              color: Colors.black,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 10,
                                                                            ),
                                                                            Text(
                                                                              "Add Option",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.black, fontSize: 15),
                                                                            ),
                                                                          ])),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                              ])),
                                                          Container(
                                                              child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Card(
                                                                  child: ListTile(
                                                                      leading: Checkbox(
                                                                          checkColor: Colors.white,
                                                                          value: isChecked2,
                                                                          onChanged: (bool? value) {
                                                                            setState(() {
                                                                              isChecked2 = value!;
                                                                            });
                                                                          }),
                                                                      title: Text('Home & Office >> Business Services >> Temp >> Shahryar')),
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
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  updateServiceMapping(service.serviceId, isChecked2.toString(), "Shahryar");
                                                                                });
                                                                                showAlertDialog3(context);
                                                                              },
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                              padding: EdgeInsets.all(0.0),
                                                                              child: Ink(
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
                                                                              onPressed: () {
                                                                                Navigator.pushNamed(context, '/Service');
                                                                              },
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                              padding: EdgeInsets.all(0.0),
                                                                              child: Ink(
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
                                                              ]))
                                                        ],
                                                      ),
                                                    ),
                                                  ])
                                            ]))
                                  ],
                                ))
                          ])
                    ])))));
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Okay"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Congrats"),
    content: Text("Service Has Been Updated!"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Okay"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Congrats"),
    content: Text("Service Variation Updated!"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog3(BuildContext context) {
  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Okay"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Congrats"),
    content: Text("Service Mapping Updated!"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
