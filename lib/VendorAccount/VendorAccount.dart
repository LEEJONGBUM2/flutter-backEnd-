import 'package:flutter/material.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';

class VendorAccount extends StatefulWidget {
  @override
  _VendorAccountState createState() => new _VendorAccountState();
}

class _VendorAccountState extends State<VendorAccount>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final priceStart = TextEditingController();
  final priceEnd = TextEditingController();
  final thumbnail = TextEditingController();
  final thumbnail2 = TextEditingController();
  int navIndex = 1;
  bool isChecked7 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = true;
  bool isChecked6 = true;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  _openImageFile(BuildContext context) async {
    final XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: ['jpg', 'png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: [typeGroup]);
    if (files.isEmpty) {
      // Operation was canceled by the user.
      return;
    }
    final XFile file = files[0];
    return file.name;
  }

  _openImagesFile(BuildContext context) async {
    final XTypeGroup jpgsTypeGroup = XTypeGroup(
      label: 'JPEGs',
      extensions: ['jpg', 'jpeg'],
    );
    final XTypeGroup pngTypeGroup = XTypeGroup(
      label: 'PNGs',
      extensions: ['png'],
    );
    final List<XFile> files = await openFiles(acceptedTypeGroups: [
      jpgsTypeGroup,
      pngTypeGroup,
    ]);
    if (files.isEmpty) {
      // Operation was canceled by the user.
      return;
    }
    return [files.length.toString(), "files"];
  }

  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    double text2 = MediaQuery.of(context).size.height;
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
                        child: const Text('Shahryar'),
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
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        flex: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: text / 1.6,
                                height: 1274,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: Text('Manage My Vendor',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: text / 70,
                                                      color: Colors.white,
                                                    ))),
                                            new Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xFF483D8B)),
                                              child: new TabBar(
                                                controller: _controller,
                                                tabs: [
                                                  new Tab(
                                                    icon: const Icon(
                                                        Icons.info_outline),
                                                    text:
                                                        '  Business \nInformation',
                                                  ),
                                                  new Tab(
                                                    icon: const Icon(
                                                        Icons.switch_account),
                                                    text:
                                                        '   Account \nInformation',
                                                  ),
                                                  new Tab(
                                                    icon: const Icon(
                                                        Icons.email_outlined),
                                                    text: ' Vendor \nAddress',
                                                  ),
                                                  new Tab(
                                                    icon: const Icon(
                                                        Icons.contact_mail),
                                                    text:
                                                        '      Bank \nInformation',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SingleChildScrollView(
                                              child: new Container(
                                                height: 1125.0,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: text / 10),
                                                child: new TabBarView(
                                                  controller: _controller,
                                                  children: <Widget>[
                                                    Container(
                                                        child:
                                                            Column(children: <
                                                                Widget>[
                                                      Text(
                                                        "Shop/Company Name",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                              'Help Company'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "ROC Number",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                              'DC1234'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Vendor Email Address",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                              'emcncn4@gmail.com'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Business Type",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                            'Organizations',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Mobile Contact Number",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                              '601234567'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Company Description",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          title: new Text(
                                                              'Good Quality service for the user (Customer)'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Business Logo",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          leading: const Icon(Icons
                                                              .add_a_photo_sharp),
                                                          title: TextField(
                                                            readOnly: true,
                                                            controller:
                                                                thumbnail2,
                                                            decoration:
                                                                InputDecoration(
                                                                    hintText:
                                                                        'Select A Business Image'),
                                                            onTap: () async {
                                                              var date =
                                                                  await _openImagesFile(
                                                                      context);
                                                              thumbnail2.text =
                                                                  date.toString();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Business Start Time",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          leading: const Icon(Icons
                                                              .monetization_on),
                                                          title: new DropdownSearch<
                                                                  String>(
                                                              mode: Mode.MENU,
                                                              showSelectedItem:
                                                                  true,
                                                              items: [
                                                                "09:30 AM",
                                                                "10:00 AM",
                                                                "10:30 AM",
                                                              ],
                                                              popupItemDisabled:
                                                                  (String s) =>
                                                                      s.startsWith(
                                                                          '0'),
                                                              onChanged: print,
                                                              selectedItem:
                                                                  "09:30 AM"),
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "Business Finish Time",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      new Card(
                                                        child: new ListTile(
                                                          leading: const Icon(Icons
                                                              .monetization_on),
                                                          title: new DropdownSearch<
                                                                  String>(
                                                              mode: Mode.MENU,
                                                              showSelectedItem:
                                                                  true,
                                                              items: [
                                                                "08:30 PM",
                                                                "09:00 PM",
                                                                "09:30 PM",
                                                              ],
                                                              popupItemDisabled:
                                                                  (String s1) =>
                                                                      s1.startsWith(
                                                                          '0'),
                                                              onChanged: print,
                                                              selectedItem:
                                                                  "08:30 PM"),
                                                        ),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text(
                                                        "Rest Days",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Monday         '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked7,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked7 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Tuesday        '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked1,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked1 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text('Wednesday  '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked2,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked2 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Thursday       '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked3,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked3 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Friday            '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked4,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked4 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Saturday      '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked5,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked5 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
                                                      Container(
                                                          width: 140,
                                                          color: Colors.white,
                                                          child: Row(children: [
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                                'Sunday         '),
                                                            Checkbox(
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                value:
                                                                    isChecked6,
                                                                onChanged:
                                                                    (bool?
                                                                        value) {
                                                                  setState(() {
                                                                    isChecked6 =
                                                                        value!;
                                                                  });
                                                                })
                                                          ])),
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
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      '/VendorAccountEdit');
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
                                                                              .edit,
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
                                                                          "Edit",
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
                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      '/VendorAccount');
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
                                                    Container(
                                                        child: Column(
                                                            children: <Widget>[
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Person In-Charge Name",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'David Lee'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Phone Number",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '601234567'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Vendor Email Address",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'emcncn4@gmail.com'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                            width: 300,
                                                            height: 30,
                                                            // ignore: deprecated_member_use
                                                            child: RaisedButton(
                                                              onPressed: () {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    '/VendorAccount');
                                                              },
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0)),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              child: Ink(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .yellow,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0)),
                                                                child:
                                                                    Container(
                                                                        constraints: BoxConstraints(
                                                                            maxWidth:
                                                                                300,
                                                                            minHeight:
                                                                                10),
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        child: Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 173,
                                                                                height: 30,
                                                                                // ignore: deprecated_member_use
                                                                                child: RaisedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pushNamed(context, '/ChangePassword');
                                                                                  },
                                                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                                  padding: EdgeInsets.all(0.0),
                                                                                  child: Ink(
                                                                                    decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(6.0)),
                                                                                    child: Container(
                                                                                        constraints: BoxConstraints(minWidth: 173, minHeight: 10),
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
                                                                                            "Change Password",
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(color: Colors.black, fontSize: 15),
                                                                                          ),
                                                                                        ])),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ])),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 13),
                                                          Text(
                                                            "Selected Business Category",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          SizedBox(height: 5),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '● Eateries >> Catering >> Cultural Foods >> Help Company'),
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccountEdit');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Color(0xFF483D8B),
                                                                              borderRadius: BorderRadius.circular(6.0)),
                                                                          child: Container(
                                                                              constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                              alignment: Alignment.center,
                                                                              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                Icon(
                                                                                  Icons.edit,
                                                                                  size: 25,
                                                                                  color: Colors.white,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  "Edit",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                              ])),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccount');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(6.0)),
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
                                                            children: <Widget>[
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Vendor Address",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'Taman Tun Dr Ismail, Kuala Lumpur, Malaysia'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Country",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'Malaysia'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "State",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'Selangor'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "City",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'Petaling Jaya'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Post Code",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '500022'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Business Latitude",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '3.146122'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Business Longitude",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '101.6255459'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccountEdit');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Color(0xFF483D8B),
                                                                              borderRadius: BorderRadius.circular(6.0)),
                                                                          child: Container(
                                                                              constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                              alignment: Alignment.center,
                                                                              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                Icon(
                                                                                  Icons.edit,
                                                                                  size: 25,
                                                                                  color: Colors.white,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  "Edit",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                              ])),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccount');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(6.0)),
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
                                                            children: <Widget>[
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Bank Name",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  'Hong Lenong Bank'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Account Number",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          new Card(
                                                            child: new ListTile(
                                                              title: new Text(
                                                                  '9820-2000-18'),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5),
                                                          Container(
                                                              width: 140,
                                                              color:
                                                                  Colors.white,
                                                              child: Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                        'isPublished:'),
                                                                    Checkbox(
                                                                        checkColor:
                                                                            Colors
                                                                                .white,
                                                                        value:
                                                                            isChecked,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isChecked =
                                                                                value!;
                                                                          });
                                                                        })
                                                                  ])),
                                                          SizedBox(height: 10),
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccountEdit');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Color(0xFF483D8B),
                                                                              borderRadius: BorderRadius.circular(6.0)),
                                                                          child: Container(
                                                                              constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                              alignment: Alignment.center,
                                                                              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                Icon(
                                                                                  Icons.edit,
                                                                                  size: 25,
                                                                                  color: Colors.white,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Text(
                                                                                  "Edit",
                                                                                  textAlign: TextAlign.center,
                                                                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                                                                ),
                                                                              ])),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
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
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/VendorAccount');
                                                                        },
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(6.0)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(6.0)),
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ])
                                    ]))
                          ],
                        ))
                  ]),
                  SizedBox(
                    height: 6,
                  ),
                ]))));
  }
}
