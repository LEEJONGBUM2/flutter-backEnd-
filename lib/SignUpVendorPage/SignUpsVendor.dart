import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/LandingPage/LandingPage.dart';
import 'package:iconnexz/VendorLandingPage/VendorLandingPage.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:iconnexz/widgets/Navbar/navbar_logo.dart';
import 'package:iconnexz/widgets/SignUpVendorBanner/SignUpVendorBanner.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';

bool _showPassword = false;
bool _showPassword1 = false;

class SignUpsVendor extends StatefulWidget {
  @override
  _SignUpsVendorState createState() => new _SignUpsVendorState();
}

class _SignUpsVendorState extends State<SignUpsVendor>
    with SingleTickerProviderStateMixin {
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final priceStart = TextEditingController();
  final priceEnd = TextEditingController();
  final thumbnail = TextEditingController();
  final thumbnail2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int navIndex = 1;
  bool isChecked7 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
  bool isChecked8 = false;
  bool isChecked9 = false;
  bool isChecked10 = false;
  bool isChecked11 = false;
  bool isChecked12 = false;
  bool _enabled = false;
  bool isDisabled = false;
  bool isDisabled1 = false;
  bool isDisabled2 = false;
  bool isDisabled3 = false;
  int selectedValue = 1;
  int selectedValue1 = 1;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 6, vsync: this);
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
    return Form(
        key: _formKey,
        child: Scaffold(
            backgroundColor: Color(0xffffffff),
            drawer: Sidenav(navIndex, (int index) {
              setState(() {
                navIndex = index;
              });
            }),
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(55.0),
                child: AppBar(
                  backgroundColor: Color(0xff042E44),
                  actions: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.notifications,
                          //     color: Colors.white54,
                          //   ),
                          //   onPressed: () {},
                          // ),
                          // SizedBox(width: 10),
                          // TextButton(
                          //   style: TextButton.styleFrom(
                          //     primary: Colors.white54,
                          //     textStyle: const TextStyle(fontSize: 20),
                          //   ),
                          //   onPressed: () {},
                          //   child: const Text('Shahryar'),
                          // ),
                          SizedBox(width: 10),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.power_settings_new,
                          //     color: Colors.white54,
                          //   ),
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, '/');
                          //   },
                          // ),
                          NavBarLogo(
                            press: () {
                              Navigator.pushNamed(context, '/');
                            },
                          ),
                        ]))
                  ],
                  leading: Row(
                    children: [
                      if (!Responsive.isDesktop(context))

                        // IconButton(
                        //   icon: Icon(
                        //     Icons.menu,
                        //     color: Colors.white54,
                        //   ),
                        //   onPressed: context.read<MenuController>().controlMenu,
                        // ),
                        if (!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_return,
                          color: Colors.white60,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/BecomeAVendor');
                        },
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 50),
                        height: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/vendorRegistration.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Vendor Registration',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.black,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('1'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Business Type",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                            // Text(
                            //   "Services",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 28,
                            //      color: Colors.black),
                            // ),
                          ]),
                          SizedBox(
                            width: text / 30,
                          ),
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('2'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Business Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                            //  Text(
                            //    "Deliver",
                            //   style: TextStyle(
                            //        fontWeight: FontWeight.bold,
                            //        fontSize: 28,
                            //        color: Colors.black),
                            //  ),
                          ]),
                          SizedBox(
                            width: text / 30,
                          ),
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('3'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Vendor Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                            //   Text(
                            //     "Get Paid",
                            //     style: TextStyle(
                            //        fontWeight: FontWeight.bold,
                            //         fontSize: 28,
                            //         color: Colors.black),
                            //   ),
                          ]),
                          SizedBox(
                            width: text / 30,
                          ),
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('4'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Business Category",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 30,
                          ),
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('5'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 30,
                          ),
                          Column(children: <Widget>[
                            Container(
                              width: 40,
                              height: 30,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 2.5,
                                  ),
                                ),
                                child: Center(
                                  child: Text('6'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bank Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: text / 75,
                                  color: Colors.black),
                            ),
                          ]),
                        ],
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: text / 1.6,
                                        height: 1470,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 0),
                                                child:
                                                    Text('Vendor Registration',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: text / 60,
                                                          color: Colors.grey,
                                                        )),
                                              ),
                                              // new Container(
                                              //   decoration:
                                              //       new BoxDecoration(
                                              //           color: Color(
                                              //               0xff1b6d1b)),
                                              //   child: new TabBar(
                                              //     controller: _controller,
                                              //     tabs: [
                                              //       new Tab(
                                              //         icon: const Icon(
                                              //             Icons.business),
                                              //         text:
                                              //             '  Business \n      Type',
                                              //       ),
                                              //       new Tab(
                                              //         icon: const Icon(Icons
                                              //             .info_outline),
                                              //         text:
                                              //             '   Business \n Information',
                                              //       ),
                                              //       new Tab(
                                              //         icon: const Icon(Icons
                                              //             .perm_identity),
                                              //         text:
                                              //             '     Vendor \n Information',
                                              //       ),
                                              //       new Tab(
                                              //         icon: const Icon(Icons
                                              //             .business_center),
                                              //         text:
                                              //             '   Business \n   Category',
                                              //       ),
                                              //       new Tab(
                                              //         icon: const Icon(Icons
                                              //             .email_outlined),
                                              //         text: 'Address',
                                              //       ),
                                              //       new Tab(
                                              //         icon: const Icon(Icons
                                              //             .contact_mail),
                                              //         text:
                                              //             '      Bank \nInformation',
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              SingleChildScrollView(
                                                child: new Container(
                                                  height: 1320.0,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: text / 10),
                                                  child: new TabBarView(
                                                    controller: _controller,
                                                    children: <Widget>[
                                                      //SignUpVendor Page No.1
                                                      Container(
                                                          child: Column(
                                                              children: <
                                                                  Widget>[
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Please Select Business Type*",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            new Card(
                                                              child:
                                                                  new ListTile(
                                                                leading: const Icon(
                                                                    Icons
                                                                        .monetization_on),
                                                                title: new DropdownSearch<
                                                                        String>(
                                                                    mode: Mode
                                                                        .MENU,
                                                                    showSelectedItem:
                                                                        true,
                                                                    items: [
                                                                      "Select",
                                                                      "Individual",
                                                                      "Organization",
                                                                    ],
                                                                    popupItemDisabled: (String
                                                                            s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                    onChanged:
                                                                        print,
                                                                    selectedItem:
                                                                        "Select"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 6,
                                                            ),
                                                            Container(
                                                                width: 140,
                                                                color: Colors
                                                                    .white,
                                                                child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          'isPublished:'),
                                                                      Checkbox(
                                                                          checkColor: Colors
                                                                              .white,
                                                                          value:
                                                                              isChecked9,
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              isChecked9 = value!;
                                                                            });
                                                                          })
                                                                    ])),
                                                            SizedBox(
                                                                height: 10),
                                                            Container(
                                                                width: 270,
                                                                child: Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            95,
                                                                        height:
                                                                            30,
                                                                        // ignore: deprecated_member_use
                                                                        child:
                                                                            RaisedButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (_formKey.currentState!.validate()) {
                                                                              ;
                                                                              Navigator.pushNamed(context, '/SignUpsVendor');
                                                                            }
                                                                          },
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                          padding:
                                                                              EdgeInsets.all(0.0),
                                                                          child:
                                                                              Ink(
                                                                            decoration:
                                                                                BoxDecoration(color: Color(0xFF483D8B), borderRadius: BorderRadius.circular(6.0)),
                                                                            child: Container(
                                                                                constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                                alignment: Alignment.center,
                                                                                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                  Icon(
                                                                                    Icons.check_outlined,
                                                                                    size: 25,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 5,
                                                                                  ),
                                                                                  Text(
                                                                                    "Next",
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
                                                                            95,
                                                                        height:
                                                                            30,
                                                                        // ignore: deprecated_member_use
                                                                        child:
                                                                            RaisedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pushNamed(context,
                                                                                '/BecomeAVendor');
                                                                          },
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                          padding:
                                                                              EdgeInsets.all(0.0),
                                                                          child:
                                                                              Ink(
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
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
                                                                    ])),
                                                          ])),
                                                      //SignUpVendor Page No.2
                                                      Container(
                                                          child:
                                                              Column(children: <
                                                                  Widget>[
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Vendor Name*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Person Vendor Name';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Vendor Name',
                                                            labelText:
                                                                "   Vendor Name",
                                                            suffixIcon: Icon(
                                                              Icons.domain,
                                                            ),
                                                          ),
                                                        )),

                                                        // new Card(
                                                        //   child: new ListTile(
                                                        //     leading: const Icon(
                                                        //         Icons
                                                        //             .assignment_ind_rounded),
                                                        //     title:
                                                        //         new TextField(
                                                        //       decoration:
                                                        //           const InputDecoration(
                                                        //               hintText:
                                                        //                   'David Lee'),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Register Of Company Number",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Register Of Company Number';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Register Of Company Number',
                                                            labelText:
                                                                "   Register Of Company Number",
                                                            suffixIcon: Icon(
                                                              Icons.dvr,
                                                            ),
                                                          ),
                                                        )),
                                                        // new Card(
                                                        //   child: new ListTile(
                                                        //     leading:
                                                        //         const Icon(
                                                        //             Icons
                                                        //                 .aod),
                                                        //     title:
                                                        //         new TextField(
                                                        //       decoration:
                                                        //           const InputDecoration(
                                                        //               hintText:
                                                        //                   '601234567'),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "E-mail*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter E-mail';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Email',
                                                            labelText:
                                                                "   Email",
                                                            suffixIcon: Icon(
                                                              Icons.event_note,
                                                            ),
                                                          ),
                                                        )),

                                                        Text(
                                                          "Company Description*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Company Description';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Company Description',
                                                            labelText:
                                                                "   Company Description",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .flight_outlined,
                                                            ),
                                                          ),
                                                        )),
                                                        Text(
                                                          "Introducer Code*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Introducer Code';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Introducer Code',
                                                            labelText:
                                                                "   Introducer Code",
                                                            suffixIcon: Icon(
                                                              Icons.dvr,
                                                            ),
                                                          ),
                                                        )),
                                                        Text(
                                                          "Contact Number*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Contact Number';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Contact Number*',
                                                            labelText:
                                                                "   Contact Number*",
                                                            suffixIcon: Icon(
                                                              Icons.add_ic_call,
                                                            ),
                                                          ),
                                                        )),

                                                        Container(
                                                          height: 35.0,
                                                          // ignore: deprecated_member_use
                                                          child: RaisedButton(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            onPressed: () {},
                                                            child: Ink(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xff2555be),
                                                                          Color(
                                                                              0xff2625be)
                                                                        ],
                                                                        begin: Alignment
                                                                            .centerLeft,
                                                                        end: Alignment
                                                                            .centerRight,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0)),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxWidth:
                                                                            90.0,
                                                                        minHeight:
                                                                            50.0),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "Request OTP",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 7),
                                                        Text(
                                                          "Verification Code*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Verification Code';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Verification Code',
                                                            labelText:
                                                                "   Verification Code",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .lock_outline,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 7,
                                                        ),

                                                        Text(
                                                          "Rest Day",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked7 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked1 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                  'Wednesday  '),
                                                              Checkbox(
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  value:
                                                                      isChecked2,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isChecked2 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked3 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked4 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked5 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                    setState(
                                                                        () {
                                                                      isChecked6 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        Text(
                                                          "Business Start Time",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .alarm_on_outlined),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select  ",
                                                                  "09:30 AM",
                                                                  "10:00 AM",
                                                                  "10:30 AM",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "09:30 AM"),
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          "Business Finish Time",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .alarm_on_outlined),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select  ",
                                                                  "08:30 PM",
                                                                  "09:00 PM",
                                                                  "09:30 PM",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s1) =>
                                                                        s1.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "08:30 PM"),
                                                          ),
                                                        ), // ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Company Image*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .add_a_photo_sharp),
                                                            title: TextField(
                                                              readOnly: true,
                                                              controller:
                                                                  thumbnail2,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Select A Image',
                                                                labelText:
                                                                    "Select A Image",
                                                              ),
                                                              onTap: () async {
                                                                var date =
                                                                    await _openImagesFile(
                                                                        context);
                                                                thumbnail2
                                                                        .text =
                                                                    date.toString();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                      isChecked9,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isChecked9 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        SizedBox(height: 10),
                                                        Container(
                                                            width: 270,
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          ;
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/SignUpsVendor');
                                                                        }
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF483D8B),
                                                                            borderRadius: BorderRadius.circular(6.0)),
                                                                        child: Container(
                                                                            constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                            alignment: Alignment.center,
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              Icon(
                                                                                Icons.check_outlined,
                                                                                size: 25,
                                                                                color: Colors.white,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Text(
                                                                                "Next",
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
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/BecomeAVendor');
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
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
                                                                ])),
                                                      ])),
                                                      //SignUpVendor Page No.3
                                                      Container(
                                                          child:
                                                              Column(children: <
                                                                  Widget>[
                                                        Text(
                                                          "Person In Charge Name*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Person In Charge Name';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Person In Charge Name',
                                                            labelText:
                                                                "   Person In Charge Name",
                                                            suffixIcon: Icon(
                                                              Icons.group_add,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Email Address*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Email Address';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Email Address',
                                                            labelText:
                                                                "   Email Address",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .mail_outline,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Password*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          obscureText:
                                                              !_showPassword,
                                                          //   controller: _textEditingController,
                                                          validator: (value) {
                                                            if ((value!.length >
                                                                    5) &&
                                                                value
                                                                    .isNotEmpty) {
                                                              return null;
                                                            } else if ((value
                                                                        .length <=
                                                                    5) &&
                                                                (value.length >=
                                                                    1)) {
                                                              return "Please write down the password at least 6 digit or character";
                                                            } else {
                                                              return "Please Enter Password";
                                                            }
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Password',
                                                            labelText:
                                                                "   Password",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .password_outlined,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Confirm Password*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Confirm Password';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Confirm Password',
                                                            labelText:
                                                                "   Confirm Password",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .password_outlined,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Contact Number*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Contact Number';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Contact Number',
                                                            labelText:
                                                                "   Contact Number",
                                                            suffixIcon: Icon(
                                                              Icons.add_ic_call,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                          height: 35.0,
                                                          // ignore: deprecated_member_use
                                                          child: RaisedButton(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0.0),
                                                            onPressed: () {},
                                                            child: Ink(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xff2555be),
                                                                          Color(
                                                                              0xff2625be)
                                                                        ],
                                                                        begin: Alignment
                                                                            .centerLeft,
                                                                        end: Alignment
                                                                            .centerRight,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              6.0)),
                                                              child: Container(
                                                                constraints:
                                                                    BoxConstraints(
                                                                        maxWidth:
                                                                            90.0,
                                                                        minHeight:
                                                                            50.0),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "Request OTP",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Verification Code*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Verification Code';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Verification Code',
                                                            labelText:
                                                                "   Verification Code",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .enhanced_encryption_outlined,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                      isChecked10,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isChecked10 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                            width: 270,
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          ;
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/SignUpsVendor');
                                                                        }
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF483D8B),
                                                                            borderRadius: BorderRadius.circular(6.0)),
                                                                        child: Container(
                                                                            constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                            alignment: Alignment.center,
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              Icon(
                                                                                Icons.check_outlined,
                                                                                size: 25,
                                                                                color: Colors.white,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Text(
                                                                                "Next",
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
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/BecomeAVendor');
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
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
                                                                ])),
                                                      ])),
                                                      //SignUpVendor Page No.4
                                                      Container(
                                                          child:
                                                              Column(children: <
                                                                  Widget>[
                                                        Text(
                                                          "Service Category",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Beauty",
                                                                  "Eateries",
                                                                  "Education",
                                                                  "Events",
                                                                  "Eateries",
                                                                  "Finance",
                                                                  "Healthcare",
                                                                  "Home & Office",
                                                                  "Industries",
                                                                  "Leisure",
                                                                  "Promotions",
                                                                  "RSVP",
                                                                  "Services",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Business Category",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Bakery",
                                                                  "Beverage",
                                                                  "Catering",
                                                                  "Clubs & Bars",
                                                                  "Food Stalls",
                                                                  "Food Trucks",
                                                                  "Gourmet",
                                                                  "Halal Cuisine",
                                                                  "Home Cooking",
                                                                  "Outlet Food",
                                                                  "Restaurant",
                                                                  "Scenic Places",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Type of Business",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Cultural Foods",
                                                                  "Event Dishes",
                                                                  "Festive Dishes",
                                                                  "Finger Food",
                                                                  "Fusion Foods",
                                                                  "Food Trucks",
                                                                  "Gourmet",
                                                                  "Halal Food",
                                                                  "Malaysian Dishes",
                                                                  "Venue Hosting",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Country Category",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "China",
                                                                  "Malaysia",
                                                                  "Pakistan",
                                                                  "SouthKorea",
                                                                  "USA",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Restaurant Category",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Mitasu",
                                                                  "Oiso",
                                                                  "AK Noodle",
                                                                  "Uncle Don",
                                                                  "Super Saigon",
                                                                  "Namaste",
                                                                  "Brew House",
                                                                  "Chicken Rice",
                                                                  "Rock U",
                                                                  "Nandos",
                                                                  "Fei Fan",
                                                                  "4 Fingers",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Type of Food",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "BBQ Chicken Rice",
                                                                  "Haineese Chicken Rice",
                                                                  "BBQ Chicken",
                                                                  "Steamed Chicken Rice",
                                                                  "Coffee",
                                                                  "Gourmet",
                                                                  "Ice Lemon Tea",
                                                                  "Water",
                                                                  "Soft Drink",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                      isChecked11,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isChecked11 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        SizedBox(height: 10),
                                                        Container(
                                                            width: 270,
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          ;
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/SignUpsVendor');
                                                                        }
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF483D8B),
                                                                            borderRadius: BorderRadius.circular(6.0)),
                                                                        child: Container(
                                                                            constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                            alignment: Alignment.center,
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              Icon(
                                                                                Icons.check_outlined,
                                                                                size: 25,
                                                                                color: Colors.white,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Text(
                                                                                "Next",
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
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/BecomeAVendor');
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
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
                                                                ])),
                                                      ])),
                                                      //SignUpVendor Page No.5
                                                      Container(
                                                          child:
                                                              Column(children: <
                                                                  Widget>[
                                                        Text(
                                                          "Address*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Address';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Address',
                                                            labelText:
                                                                "   Address",
                                                            suffixIcon: Icon(
                                                              Icons.domain,
                                                            ),
                                                          ),
                                                        )),
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
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "China",
                                                                  "Malaysia",
                                                                  "Pakistan",
                                                                  "South Korea",
                                                                  "USA",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
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
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Johor",
                                                                  "Selangor",
                                                                  "Federal Territory",
                                                                  "Malacca",
                                                                  "Negeri Sembilan",
                                                                  "Penang",
                                                                  "Perak",
                                                                  "Sabah",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
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
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          child: new ListTile(
                                                            leading: const Icon(
                                                                Icons
                                                                    .monetization_on),
                                                            title: new DropdownSearch<
                                                                    String>(
                                                                mode: Mode.MENU,
                                                                showSelectedItem:
                                                                    true,
                                                                items: [
                                                                  "Select",
                                                                  "Kuala Lumpur",
                                                                  "Shah Alam",
                                                                  "Petaling Jaya",
                                                                ],
                                                                popupItemDisabled:
                                                                    (String s) =>
                                                                        s.startsWith(
                                                                            'S'),
                                                                onChanged:
                                                                    print,
                                                                selectedItem:
                                                                    "Select"),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "PostCode*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter PostCode';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   PostCode',
                                                            labelText:
                                                                "   PostCode",
                                                            suffixIcon: Icon(
                                                              Icons.dvr,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Shop Latitude*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Shop Latitude';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Shop Latitude',
                                                            labelText:
                                                                "   Shop Latitude",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .location_pin,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Shop Longtitude*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Shop Longtitude';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Shop Longtitude',
                                                            labelText:
                                                                "   Shop Longtitude",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .location_searching,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Do you have your own Delivery Team?",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          color:
                                                              Colors.yellow[50],
                                                          child:
                                                              new RadioListTile(
                                                            value: 1,
                                                            groupValue:
                                                                selectedValue,
                                                            title: Text('Yes'),
                                                            onChanged: (value) =>
                                                                setState(() =>
                                                                    selectedValue =
                                                                        1),
                                                          ),
                                                        ),
                                                        new Card(
                                                          color:
                                                              Colors.yellow[50],
                                                          child:
                                                              new RadioListTile(
                                                            value: 0,
                                                            groupValue:
                                                                selectedValue,
                                                            title: Text('No'),
                                                            onChanged: (value) =>
                                                                setState(() =>
                                                                    selectedValue =
                                                                        0),
                                                          ),
                                                        ),
                                                        Text(
                                                          "How do you calculate your delivery fees?",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                          color:
                                                              Colors.yellow[50],
                                                          child:
                                                              new RadioListTile(
                                                            value: 1,
                                                            groupValue:
                                                                selectedValue1,
                                                            title: Text(
                                                                'Flat Rate'),
                                                            onChanged: (value) =>
                                                                setState(() =>
                                                                    selectedValue1 =
                                                                        1),
                                                          ),
                                                        ),
                                                        new Card(
                                                          color:
                                                              Colors.yellow[50],
                                                          child:
                                                              new RadioListTile(
                                                            value: 0,
                                                            groupValue:
                                                                selectedValue1,
                                                            title: Text(
                                                                'Distance Based'),
                                                            onChanged: (value) =>
                                                                setState(() =>
                                                                    selectedValue1 =
                                                                        0),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "For First*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter For First';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   For First',
                                                            labelText:
                                                                "   For First",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .local_shipping_outlined,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Every Additional 1KM Charge*",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        new Card(
                                                            child:
                                                                new TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter Every Additional 1KM Charge';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              const InputDecoration(
                                                            hintText:
                                                                '   Every Additional 1KM Charge',
                                                            labelText:
                                                                "   Every Additional 1KM Charge",
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .local_shipping,
                                                            ),
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Container(
                                                            width: 140,
                                                            color: Colors.white,
                                                            child:
                                                                Row(children: [
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
                                                                      isChecked11,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      isChecked11 =
                                                                          value!;
                                                                    });
                                                                  })
                                                            ])),
                                                        SizedBox(height: 10),
                                                        Container(
                                                            width: 270,
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        if (_formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                          ;
                                                                          Navigator.pushNamed(
                                                                              context,
                                                                              '/SignUpsVendor');
                                                                        }
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Color(0xFF483D8B),
                                                                            borderRadius: BorderRadius.circular(6.0)),
                                                                        child: Container(
                                                                            constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                            alignment: Alignment.center,
                                                                            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                              Icon(
                                                                                Icons.check_outlined,
                                                                                size: 25,
                                                                                color: Colors.white,
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Text(
                                                                                "Next",
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
                                                                    width: 95,
                                                                    height: 30,
                                                                    // ignore: deprecated_member_use
                                                                    child:
                                                                        RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            '/BecomeAVendor');
                                                                      },
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(6.0)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
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
                                                                ])),
                                                      ])),
                                                      //SignUpVendor Page No.6
                                                      Container(
                                                          child: Column(
                                                              children: <
                                                                  Widget>[
                                                            Text(
                                                              "Bank Name",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            new Card(
                                                                child:
                                                                    new TextFormField(
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Please enter Bank Name';
                                                                }
                                                                return null;
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                hintText:
                                                                    '   Bank Name',
                                                                labelText:
                                                                    "   Bank Name",
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .account_box,
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Bank Account Number",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            new Card(
                                                                child:
                                                                    new TextFormField(
                                                              validator:
                                                                  (value) {
                                                                if (value ==
                                                                        null ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return 'Please enter Bank Account Number';
                                                                }
                                                                return null;
                                                              },
                                                              decoration:
                                                                  const InputDecoration(
                                                                hintText:
                                                                    '   Bank Account Number',
                                                                labelText:
                                                                    "   Bank Account Number",
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .account_box_outlined,
                                                                ),
                                                              ),
                                                            )),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Container(
                                                                width: 140,
                                                                color: Colors
                                                                    .white,
                                                                child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                          'isPublished:'),
                                                                      Checkbox(
                                                                          checkColor: Colors
                                                                              .white,
                                                                          value:
                                                                              isChecked11,
                                                                          onChanged:
                                                                              (bool? value) {
                                                                            setState(() {
                                                                              isChecked11 = value!;
                                                                            });
                                                                          })
                                                                    ])),
                                                            SizedBox(
                                                                height: 10),
                                                            Container(
                                                                width: 270,
                                                                child: Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            95,
                                                                        height:
                                                                            30,
                                                                        // ignore: deprecated_member_use
                                                                        child:
                                                                            RaisedButton(
                                                                          onPressed:
                                                                              () {
                                                                            if (_formKey.currentState!.validate()) {
                                                                              ;
                                                                              Navigator.pushNamed(context, '/BecomeAVendor');
                                                                            }
                                                                          },
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                          padding:
                                                                              EdgeInsets.all(0.0),
                                                                          child:
                                                                              Ink(
                                                                            decoration:
                                                                                BoxDecoration(color: Color(0xFF483D8B), borderRadius: BorderRadius.circular(6.0)),
                                                                            child: Container(
                                                                                constraints: BoxConstraints(maxWidth: 100, minHeight: 10),
                                                                                alignment: Alignment.center,
                                                                                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                                                                  Icon(
                                                                                    Icons.check_outlined,
                                                                                    size: 25,
                                                                                    color: Colors.white,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 5,
                                                                                  ),
                                                                                  Text(
                                                                                    "Submit",
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
                                                                            95,
                                                                        height:
                                                                            30,
                                                                        // ignore: deprecated_member_use
                                                                        child:
                                                                            RaisedButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pushNamed(context,
                                                                                '/BecomeAVendor');
                                                                          },
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                                                                          padding:
                                                                              EdgeInsets.all(0.0),
                                                                          child:
                                                                              Ink(
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.0)),
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
                                                                    ])),
                                                          ])),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]))
                                  ],
                                ))
                          ]),
                      SizedBox(
                        height: 6,
                      ),
                    ])))));
  }
}
