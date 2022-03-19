// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SignUpsVendorD extends StatefulWidget {
  SignUpsVendorD({Key? key}) : super(key: key);

  @override
  _SignUpsVendorDState createState() => _SignUpsVendorDState();
}

class _SignUpsVendorDState extends State<SignUpsVendorD> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword1 = false;
  String dropdownValue = 'Individual       ';
  //File? _image;
  bool isVisible = true;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  String dropdownValue2 = '9:30 AM    ';
  String dropdownValue1 = '8:30 PM    ';
  bool mondayCheck = false;
  bool tuesdayCheck = false;
  bool wednesdayCheck = false;
  bool thursdayCheck = false;
  bool fridayCheck = false;
  bool saturdayCheck = false;
  bool sundayCheck = false;
  String dropdownValue6 = 'Please Select Category   ';
  String dropdownValue7 = 'Select a Category        ';
  String dropdownValue8 = 'Select a Type of Business';
  String dropdownValue3 = 'Please Select Category   ';
  String dropdownValue4 = 'Select a Category        ';
  String dropdownValue5 = 'Select a Type of Food    ';
  int selectedValue = 1;
  int selectedValue1 = 1;
  String dropdownValue9 = 'Select a Country  ';
  String dropdownValue10 = 'Select a State     ';
  String dropdownValue11 = 'Select a City      ';
  String dropdownValue12 = 'Select a Bank     ';
  final _controller0 = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();
  final _controller10 = TextEditingController();
  final _controller11 = TextEditingController();
  final _controller12 = TextEditingController();
  final _controller13 = TextEditingController();
  final _controller14 = TextEditingController();
  final _controller15 = TextEditingController();
  final _controller16 = TextEditingController();
  final _controller17 = TextEditingController();
  final _controller18 = TextEditingController();
  final _controller19 = TextEditingController();
  final _controller20 = TextEditingController();
  var search1;
  var search2;
  var search3;
  var search4;
  var search5;
  var search6;
  var search7;
  var search8;
  var search9;
  var search10;
  var search11;
  var search12;
  var search13;
  PlatformFile? objFile = null;
  PlatformFile? objFile2 = null;

  // void Photo(ImageSource source) async {
  //   final _picker = ImagePicker();
  //   final PickedFile? pickedFile =
  //       await _picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       print('No image selected.');
  //       //_image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  //   final bytes = await pickedFile!.readAsBytes();
  // }

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

    var result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['jpg', 'png'],
      type: FileType.custom,
      withReadStream:
          true, // this will return PlatformFile object with read stream
    );
    if (result != null) {
      setState(() {
        objFile2 = result.files.single;
      });
    }
  }

  void uploadSelectedFile2() async {
    //---Create http package multipart request object
    final request = http.MultipartRequest(
      "POST",
      Uri.parse("https://172.30.1.10:45455/api/VendorRegImageModels"),
      //  Uri.parse("https://192.168.1.106:45455/api/VendorRegImageModels"),
    );
    // ignore: unnecessary_new
    request.files.add(new http.MultipartFile(
        "fileobj", objFile!.readStream!, objFile!.size,
        filename: objFile!.name));

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

  List<Widget> pageChildren(double width) {
    double text = MediaQuery.of(context).size.width;
    return <Widget>[
      //Page 1 starts
      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Column(children: <Widget>[
              Visibility(
                visible: isVisible,
                child: Container(
                    child: Column(children: <Widget>[
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
                              fontSize: text / 90,
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
                        width: text / 40,
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
                              fontSize: text / 90,
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
                        width: text / 40,
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
                              fontSize: text / 90,
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
                        width: text / 40,
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                      SizedBox(
                        width: text / 40,
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                      SizedBox(
                        width: text / 40,
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                    ],
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      "Please Select Business Type",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Text(
                      "*",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red),
                    ),
                  ]),
                  // Card(
                  //   child: ListTile(
                  //     leading: const Icon(Icons.monetization_on),
                  //     title: DropdownSearch<String>(
                  //         validator: (String? item) {
                  //           if (item == null)
                  //             return "Select Tax Class";
                  //           else
                  //             return null;
                  //         },
                  //         mode: Mode.MENU,
                  //         showSelectedItem: true,
                  //         items: ['Individual       ', 'Organization     '],
                  //         onChanged: (data) {
                  //           search1 = data;
                  //         }),
                  //   ),
                  // ),

                  Row(
                    children: <Widget>[
                      Container(
                        width: 150,
                        //height: 500,
                        //padding: EdgeInsets.symmetric(vertical: 30),
                        //color: Color(0xffD3D3D3),
                        child: DropdownSearch<String>(
                            validator: (String? item) {
                              if (item == null) {
                                return "Select Business Type";
                              } else {
                                return null;
                              }
                            },
                            mode: Mode.MENU,
                            showSelectedItem: true,
                            items: ['Individual       ', 'Organization     '],
                            onChanged: (data) {
                              search1 = data;
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 35.0,
                      // ignore: deprecated_member_use
                      child: GFButton(
                        // onPressed: () =>
                        //     setState(() => isVisible1 = !isVisible1),
                        onPressed: () => setState(() {
                          isVisible = false;
                          isVisible1 = true;
                        }),
                        color: GFColors.SUCCESS,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    )
                  ]),
                ])),
              ),
              SizedBox(
                width: 50,
              ),
            ])
          ])), //Page 1 ends
      //Page 2 starts
      Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Column(children: <Widget>[
          Visibility(
            visible: isVisible1,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  fontSize: text / 90,
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
                            width: text / 40,
                          ),
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: [
                        Container(
                          width: 400,
                          alignment: Alignment(1.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Business Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.orange,
                                    //color: kPrimaryColor,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller0,
                                    keyboardType: TextInputType.text,
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Vendor Name";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Vendor Name*",
                                      labelText: "Vendor Name*",
                                      suffixIcon: Icon(
                                        Icons.domain,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller1,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Resigter Of Company Number";
                                    },
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'Register Of Company Number',
                                      labelText: 'Register Of Company Number',
                                      suffixIcon: Icon(
                                        Icons.dvr,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller2,
                                    keyboardType: TextInputType.text,

                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Email";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email*",
                                      labelText: "Email*",
                                      suffixIcon: Icon(
                                        Icons.event_note,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller3,
                                    keyboardType: TextInputType.text,

                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Company Description";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Company Description*",
                                      labelText: "Company Description*",
                                      suffixIcon: Icon(
                                        Icons.flight_outlined,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller4,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Introducer Code";
                                    },
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter(
                                          RegExp('[0-9]')),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: 'Introducer Code',
                                      labelText: 'Introducer Code',
                                      suffixIcon: Icon(
                                        Icons.dvr,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 330,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment(-0.8, -0.8),
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.orange,
                                    //color: kPrimaryColor,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller5,
                                    keyboardType: TextInputType.phone,
                                    // inputFormatters: [
                                    //   WhitelistingTextInputFormatter(RegExp('[0-9]')),
                                    // ],
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      //String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      String patttern =
                                          r'(^(?:[+0][1-9])?[0-9]{10,12}$)';

                                      RegExp regExp = new RegExp(patttern);
                                      if (value!.length == 0) {
                                        return 'Please enter mobile number';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Invalid Phone Number, Please enter valid mobile number';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Contact Number*",
                                      labelText: "Contact Number*",
                                      suffixIcon: Icon(
                                        Icons.add_ic_call,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 35.0,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0)),
                                    padding: EdgeInsets.all(0.0),
                                    onPressed: () {},
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xff2555be),
                                              Color(0xff2625be)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(6.0)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 90.0, minHeight: 50.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Request OTP",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller6,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter(
                                          RegExp('[0-9]')),
                                    ],
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Verification Code";
                                    },

                                    decoration: InputDecoration(
                                      hintText: "Verification Code*",
                                      labelText: "Verification Code*",
                                      suffixIcon: Icon(
                                        Icons.lock_outline,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Rest Day",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "Monday",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Checkbox(
                                                // value: isChecked,
                                                // onChanged: (checked) {
                                                //   setState(() {
                                                //     isChecked = checked!;
                                                //   });
                                                // }
                                                checkColor: Colors.white,
                                                value: mondayCheck,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    mondayCheck = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                    ]),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Tuesday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked1,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked1 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: tuesdayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            tuesdayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Wednesday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked2,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked2 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: wednesdayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            wednesdayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Thursday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked3,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked3 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: thursdayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            thursdayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Friday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked4,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked4 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: fridayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            fridayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Saturday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked5,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked5 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: saturdayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            saturdayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Sunday",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Checkbox(
                                        // value: isChecked6,
                                        // onChanged: (checked) {
                                        //   setState(() {
                                        //     isChecked6 = checked!;
                                        //   });
                                        // }
                                        checkColor: Colors.white,
                                        value: sundayCheck,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            sundayCheck = value!;
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Business Hours",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 120,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select Start Business Hour";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    '9:30 AM ',
                                                    '10:00 AM',
                                                    '10:30 AM'
                                                  ],
                                                  onChanged: (data) {
                                                    search2 = data;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              width: 120,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select End Business Hour";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    '8:30 PM',
                                                    '9:00 PM',
                                                    '9:30 PM'
                                                  ],
                                                  onChanged: (data) {
                                                    search3 = data;
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Company Image",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "*",
                                        style: TextStyle(
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Card(
                                  child: Column(
                                    children: [
                                      //------Button to choose file using file picker plugin
                                      RaisedButton(
                                          child: Text("Choose Thumbnail Image"),
                                          onPressed: () =>
                                              chooseFileUsingFilePicker()),
                                      //------Show file name when file is selected
                                      if (objFile != null)
                                        Text("File name : ${objFile!.name}"),
                                      //------Show file size when file is selected
                                      if (objFile != null)
                                        Text(
                                            "File size : ${objFile!.size} bytes"),
                                      //------Show upload utton when file is selected
                                    ],
                                  ),
                                ),
                                Card(
                                  child: Column(
                                    children: [
                                      //------Button to choose file using file picker plugin
                                      RaisedButton(
                                          child: Text("Select the image file"),
                                          onPressed: () =>
                                              chooseFileUsingFilePicker2()),
                                      //------Show file name when file is selected
                                      if (objFile2 != null)
                                        Text("File name : ${objFile2!.name}"),
                                      //------Show file size when file is selected
                                      if (objFile2 != null)
                                        Text(
                                            "File size : ${objFile2!.size} bytes"),
                                      //------Show upload utton when file is selected
                                    ],
                                  ),
                                ),
                                // Center(
                                //   child: Container(
                                //     width: MediaQuery.of(context).size.width,
                                //     height: 100.0,
                                //     child: Center(
                                //       child: _image == null
                                //           ? Text("Image Space")
                                //           : Image.file(_image!),
                                //     ),
                                //   ),
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Container(
                                //       height: 30,
                                //       child: RaisedButton(
                                //         child: Text(
                                //           'Select the file',
                                //           style: TextStyle(fontSize: 16),
                                //         ),
                                //         onPressed: () =>
                                //             Photo(ImageSource.gallery),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Container(
                                    height: 35.0,
                                    // ignore: deprecated_member_use
                                    child: GFButton(
                                      onPressed: () => setState(() {
                                        isVisible = true;
                                        isVisible1 = false;
                                      }),
                                      // Navigator.pushNamed(
                                      //     context, '/SignupVendor1');
                                      color: GFColors.SECONDARY,
                                      child: Text(
                                        'Back',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 35.0,
                                    // ignore: deprecated_member_use
                                    child: GFButton(
                                      onPressed:
                                          // if (_formKey.currentState!.validate()) {
                                          // Do something like updating SharedPreferences or User Settings etc.
                                          () => setState(() {
                                        // isVisible = true;
                                        isVisible1 = false;
                                        isVisible2 = true;
                                      }),
                                      // }
                                      color: GFColors.SUCCESS,
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  )
                                ]),
                                SizedBox(
                                  height: 14,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ])
      ])), //Page 2 ends
      //Page 3 starts
      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Column(children: <Widget>[
              Visibility(
                visible: isVisible2,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                      fontSize: text / 90,
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
                                width: text / 40,
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
                                      fontSize: text / 90,
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
                                width: text / 40,
                              ),
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
                                      fontSize: text / 90,
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
                                width: text / 40,
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
                                      fontSize: text / 90,
                                      color: Colors.black),
                                ),
                              ]),
                              SizedBox(
                                width: text / 40,
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
                                      fontSize: text / 90,
                                      color: Colors.black),
                                ),
                              ]),
                              SizedBox(
                                width: text / 40,
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
                                      fontSize: text / 90,
                                      color: Colors.black),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: [
                            Container(
                              width: 400,
                              alignment: Alignment(1.0, -1.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Vendor Information",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 30,
                                      child: Divider(
                                        color: Colors.red,
                                        //color: kPrimaryColor,
                                        thickness: 4,
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller7,
                                        keyboardType: TextInputType.text,
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Please Enter Person In Charge Name";
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Person In Charge Name*",
                                          labelText: "Person In Charge Name*",
                                          suffixIcon: Icon(
                                            Icons.group_add,
                                          ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller8,
                                        keyboardType: TextInputType.text,
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Please Enter Email Address";
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Email Address*",
                                          labelText: "Email Address*",
                                          suffixIcon: Icon(
                                            Icons.mail_outline,
                                          ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller9,
                                        keyboardType: TextInputType.text,
                                        obscureText: !_showPassword,
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          if ((value!.length > 5) &&
                                              value.isNotEmpty) {
                                            return null;
                                          } else if ((value.length <= 5) &&
                                              (value.length >= 1)) {
                                            return "Please write down the password at least 6 digit or character";
                                          } else {
                                            return "Please Enter Password";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Password*",
                                          labelText: "Password*",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _showPassword = !_showPassword;
                                              });
                                            },
                                            child: Icon(
                                              _showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                          ),
                                          // suffixIcon: Icon(
                                          //   Icons.lock_outline,
                                          // ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller10,
                                        keyboardType: TextInputType.text,
                                        obscureText: !_showPassword1,
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          if ((value!.length > 5) &&
                                              value.isNotEmpty) {
                                            return null;
                                          } else if ((value.length <= 5) &&
                                              (value.length >= 1)) {
                                            return "Please write down the password at least 6 digit or character";
                                          } else {
                                            return "Please Enter Confrim Password";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Confirm Password*",
                                          labelText: "Confirm Password*",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _showPassword1 =
                                                    !_showPassword1;
                                              });
                                            },
                                            child: Icon(
                                              _showPassword1
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                          ),
                                          // suffixIcon: Icon(
                                          //   Icons.password_outlined,
                                          // ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Container(
                              width: 400,
                              alignment: Alignment(-0.8, -0.8),
                              child: SingleChildScrollView(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 30,
                                      child: Divider(
                                        color: Colors.orange,
                                        //color: kPrimaryColor,
                                        thickness: 4,
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller11,
                                        keyboardType: TextInputType.phone,
                                        // inputFormatters: [
                                        //   WhitelistingTextInputFormatter(RegExp('[0-9]')),
                                        // ],
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          //String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                          String patttern =
                                              r'(^(?:[+0][1-9])?[0-9]{10,12}$)';

                                          RegExp regExp = new RegExp(patttern);
                                          if (value!.length == 0) {
                                            return 'Please enter mobile number';
                                          } else if (!regExp.hasMatch(value)) {
                                            return 'Invalid Phone Number, Please enter valid mobile number';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Contact Number*",
                                          labelText: "Contact Number*",
                                          suffixIcon: Icon(
                                            Icons.add_ic_call,
                                          ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 35.0,
                                      // ignore: deprecated_member_use
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0)),
                                        padding: EdgeInsets.all(0.0),
                                        onPressed: () {},
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xff2555be),
                                                  Color(0xff2625be)
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.0)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 90.0,
                                                minHeight: 50.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Request OTP",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: TextFormField(
                                        controller: _controller12,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          WhitelistingTextInputFormatter(
                                              RegExp('[0-9]')),
                                        ],
                                        //   controller: _textEditingController,
                                        validator: (value) {
                                          return value!.isNotEmpty
                                              ? null
                                              : "Please Enter Verification Code";
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Verification Code*",
                                          labelText: "Verification Code*",
                                          suffixIcon: Icon(
                                            Icons.enhanced_encryption_outlined,
                                          ),
                                        ),
                                      ),
                                      width: 400,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: <Widget>[
                                      SizedBox(
                                        width: 110,
                                      ),
                                      Container(
                                        height: 35.0,
                                        // ignore: deprecated_member_use
                                        child: GFButton(
                                          onPressed: () => setState(() {
                                            isVisible2 = false;
                                            isVisible1 = true;
                                          }),
                                          // Navigator.pushNamed(
                                          //     context, '/SignupVendor2');
                                          color: GFColors.SECONDARY,
                                          child: Text(
                                            'Back',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 35.0,
                                        // ignore: deprecated_member_use
                                        child: GFButton(
                                          // if (_formKey.currentState!
                                          //     .validate()) {
                                          onPressed: () => setState(() {
                                            isVisible2 = false;
                                            isVisible3 = true;
                                          }),
                                          // }
                                          color: GFColors.SUCCESS,
                                          child: Text(
                                            'Next',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      )
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ])
          ])), //Page 3 ends
      //Page 4 starts
      Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Column(children: <Widget>[
              Visibility(
                visible: isVisible3,
                child: Container(
                    child: Column(children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              fontSize: text / 90,
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
                        width: text / 40,
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
                              fontSize: text / 90,
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
                        width: text / 40,
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
                              fontSize: text / 90,
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
                        width: text / 40,
                      ),
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                      SizedBox(
                        width: text / 40,
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                      SizedBox(
                        width: text / 40,
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
                              fontSize: text / 90,
                              color: Colors.black),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: <Widget>[
                        Text(
                          "Service Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Service Category";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'Beauty                   ',
                                'Eateries                 ',
                                'Education                ',
                                'Events                   ',
                                'Finance                  ',
                                'Healthcare               ',
                                'Home & Office            ',
                                'Industries               ',
                                'Leisure                  ',
                                'Promotions               ',
                                'RSVP                     ',
                                'Services                 ',
                              ],
                              onChanged: (data) {
                                search4 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      SizedBox(
                        width: 60,
                      ),
                      Column(children: <Widget>[
                        Text(
                          "Business Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Business Category";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'Bakery                   ',
                                'Beverage                 ',
                                'Catering                 ',
                                'Clubs & Bars             ',
                                'Food Stalls              ',
                                'Food Trucks              ',
                                'Gourmet                  ',
                                'Halal Cuisine            ',
                                'Home Cooking             ',
                                'Outlet Food              ',
                                'Restaurant               ',
                                'Scenic Places            ',
                              ],
                              onChanged: (data) {
                                search5 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      SizedBox(
                        width: 60,
                      ),
                      Column(children: <Widget>[
                        Text(
                          "Type of Business",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Type of Business";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'Cultural Foods           ',
                                'Event Dishes             ',
                                'Festive Dishes           ',
                                'Finger Food              ',
                                'Fusion Foods             ',
                                'Gourmet                  ',
                                'Halal Food               ',
                                'Malaysian Dishes         ',
                                'Venue Hosting            ',
                              ],
                              onChanged: (data) {
                                search6 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      SizedBox(
                        width: 60,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 14,
                            ),
                            // Container(
                            //   height: 30.0,
                            //   // ignore: deprecated_member_use
                            //   child: GFButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => SignUpVendorPage4()),
                            //       );
                            //     },
                            //     color: GFColors.WARNING,
                            //     child: Text(
                            //       'ADD',
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(children: <Widget>[
                        Text(
                          "Country Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Country Category";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'China                    ',
                                'Malaysia                 ',
                                'Pakistan                 ',
                                'SouthKorea               ',
                                'USA                      ',
                              ],
                              onChanged: (data) {
                                search7 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      SizedBox(
                        width: 60,
                      ),
                      Column(children: <Widget>[
                        Text(
                          "Restaurant Category",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Restaurant Category";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'Mitasu                   ',
                                'Oiso                     ',
                                'AK Noodle                ',
                                'Uncle Don                ',
                                'Super Saigon             ',
                                'Namaste                  ',
                                'Brew House               ',
                                'Chicken Rice             ',
                                'Rock U                   ',
                                'Nandos                   ',
                                'Fei Fan                  ',
                                '4 Fingers                ',
                              ],
                              onChanged: (data) {
                                search8 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      SizedBox(
                        width: 60,
                      ),
                      Column(children: <Widget>[
                        Text(
                          "Type of Food",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 150,
                          //height: 500,
                          //padding: EdgeInsets.symmetric(vertical: 30),
                          //color: Color(0xffD3D3D3),
                          child: DropdownSearch<String>(
                              validator: (String? item) {
                                if (item == null) {
                                  return "Select Type of Food";
                                } else {
                                  return null;
                                }
                              },
                              mode: Mode.MENU,
                              showSelectedItem: true,
                              items: [
                                'BBQ Chicken Rice         ',
                                'Haineese Chicken Rice    ',
                                'BBQ Chicken              ',
                                'Steamed Chicken Rice     ',
                                'Coffee                   ',
                                'Gourmet                  ',
                                'Ice Lemon Tea            ',
                                'Water                    ',
                                'Soft Drink               ',
                              ],
                              onChanged: (data) {
                                search9 = data;
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                      Column(
                        children: [
                          Row(children: <Widget>[
                            SizedBox(
                              width: 80,
                            ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 110,
                    ),
                    Container(
                      height: 35.0,
                      // ignore: deprecated_member_use
                      child: GFButton(
                        onPressed: () => setState(() {
                          isVisible3 = false;
                          isVisible2 = true;
                        }),
                        // Navigator.pushNamed(
                        //     context, '/SignupVendor2');
                        color: GFColors.SECONDARY,
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 35.0,
                      // ignore: deprecated_member_use
                      child: GFButton(
                        // if (_formKey.currentState!
                        //     .validate()) {
                        onPressed: () => setState(() {
                          isVisible3 = false;
                          isVisible4 = true;
                        }),
                        // }
                        color: GFColors.SUCCESS,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    )
                  ]),
                ])),
              ),
              SizedBox(
                width: 50,
              ),
            ])
          ])), //Page 4 ends
      //Page 5 starts
      Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Column(children: <Widget>[
          Visibility(
            visible: isVisible4,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
                          ),
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: [
                        Container(
                          width: 400,
                          alignment: Alignment(1.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.cyan,
                                    //color: kPrimaryColor,
                                    thickness: 4,
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller13,
                                    keyboardType: TextInputType.text,
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Address";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Address*",
                                      labelText: "Address*",
                                      suffixIcon: Icon(
                                        Icons.domain,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Country",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 150,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select Country";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    'China             ',
                                                    'Malaysia          ',
                                                    'Pakistan          ',
                                                    'South Korea       ',
                                                    'USA               ',
                                                  ],
                                                  onChanged: (data) {
                                                    search10 = data;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "State",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 170,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 150,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select State";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    'Johor              ',
                                                    'Selangor           ',
                                                    'Federal Territory  ',
                                                    'Malacca            ',
                                                    'Negeri Sembilan    ',
                                                    'Penang             ',
                                                    'Perak              ',
                                                    'Sabah              ',
                                                  ],
                                                  onChanged: (data) {
                                                    search11 = data;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "City",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 182,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 150,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select City";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    'Kuala Lumpur       ',
                                                    'Shah Alam          ',
                                                    'Petaling Jaya      ',
                                                  ],
                                                  onChanged: (data) {
                                                    search12 = data;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                Container(
                                  child: TextFormField(
                                    controller: _controller14,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter(
                                          RegExp('[0-9]')),
                                    ],
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Postcode";
                                    },

                                    decoration: InputDecoration(
                                      hintText: "Postcode*",
                                      labelText: "Postcode*",
                                      suffixIcon: Icon(
                                        Icons.local_offer,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller15,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Invalid Field";
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Shop Latitude',
                                      labelText: 'Shop Latitude',
                                      suffixIcon: Icon(
                                        Icons.location_pin,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller16,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Shop Longitude";
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Shop Longitude',
                                      labelText: 'Shop Longitude',
                                      suffixIcon: Icon(
                                        Icons.location_searching,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment(-0.8, -0.8),
                          child: SingleChildScrollView(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.cyan,
                                    //color: kPrimaryColor,
                                    thickness: 4,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Do you have your own Delivery Team?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  color: Colors.yellow[50],
                                  width: 350,
                                  height: 45,
                                  child: RadioListTile(
                                    value: 1,
                                    groupValue: selectedValue,
                                    title: Text('Yes'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 1),
                                  ),
                                ),
                                Container(
                                  color: Colors.yellow[100],
                                  width: 350,
                                  height: 45,
                                  child: RadioListTile(
                                    value: 0,
                                    groupValue: selectedValue,
                                    title: Text('No'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 0),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "How do you calculate your delivery fees?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  color: Colors.yellow[50],
                                  width: 350,
                                  height: 45,
                                  child: RadioListTile(
                                    value: 1,
                                    groupValue: selectedValue1,
                                    title: Text('Flat Rate'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue1 = 1),
                                  ),
                                ),
                                Container(
                                  color: Colors.yellow[100],
                                  width: 350,
                                  height: 45,
                                  child: RadioListTile(
                                    value: 0,
                                    groupValue: selectedValue1,
                                    title: Text('Distance Based'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue1 = 0),
                                  ),
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller17,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Flat Rate";
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'RM ???',
                                      labelText: 'Flat Rate',
                                      suffixIcon: Icon(
                                        Icons.local_shipping,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller18,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter For First";
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'KM ???',
                                      labelText: 'For First',
                                      suffixIcon: Icon(
                                        Icons.local_shipping_outlined,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller19,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Every additional 1KM Charge";
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'RM ???',
                                      labelText: 'Every additional 1KM Charge',
                                      suffixIcon: Icon(
                                        Icons.local_shipping,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 110,
                                  ),
                                  Container(
                                    height: 35.0,
                                    // ignore: deprecated_member_use
                                    child: GFButton(
                                      onPressed: () => setState(() {
                                        isVisible4 = false;
                                        isVisible3 = true;
                                      }),
                                      color: GFColors.SECONDARY,
                                      child: Text(
                                        'Back',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 35.0,
                                    // ignore: deprecated_member_use
                                    child: GFButton(
                                      onPressed:
                                          // if (_formKey.currentState!.validate()) {
                                          // Do something like updating SharedPreferences or User Settings etc.
                                          () => setState(() {
                                        // isVisible = true;
                                        isVisible4 = false;
                                        isVisible5 = true;
                                      }),
                                      color: GFColors.SUCCESS,
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ])
      ])), //Page 5 ends
      //Page 6 starts
      Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
        Column(children: <Widget>[
          Visibility(
            visible: isVisible5,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
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
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                          SizedBox(
                            width: text / 40,
                          ),
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
                                  fontSize: text / 90,
                                  color: Colors.black),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(children: [
                        Container(
                          width: 400,
                          alignment: Alignment(1.0, -1.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Bank Information",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      color: Colors.grey[700]),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: 30,
                                  child: Divider(
                                    color: Colors.yellow,
                                    //color: kPrimaryColor,
                                    thickness: 4,
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Bank Name",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 105,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: 165,
                                              //height: 500,
                                              //padding: EdgeInsets.symmetric(vertical: 30),
                                              //color: Color(0xffD3D3D3),
                                              child: DropdownSearch<String>(
                                                  validator: (String? item) {
                                                    if (item == null) {
                                                      return "Select Bank Name";
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  mode: Mode.MENU,
                                                  showSelectedItem: true,
                                                  items: [
                                                    'Hong Leong Bank   ',
                                                    'CIMB Bank         ',
                                                    'May Bank          ',
                                                    'Affin Bank        ',
                                                    'Alliance Bank     ',
                                                  ],
                                                  onChanged: (data) {
                                                    search13 = data;
                                                  }),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  child: TextFormField(
                                    controller: _controller20,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      WhitelistingTextInputFormatter(
                                          RegExp('[0-9]')),
                                    ],
                                    //   controller: _textEditingController,
                                    validator: (value) {
                                      return value!.isNotEmpty
                                          ? null
                                          : "Please Enter Bank Account Number";
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Bank Account Number*",
                                      labelText: "Bank Account Number*",
                                      suffixIcon: Icon(
                                        Icons.add_ic_call,
                                      ),
                                    ),
                                  ),
                                  width: 400,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 400,
                          alignment: Alignment(-0.8, -0.8),
                          child: SingleChildScrollView(
                            child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.center,

                                ),
                          ),
                        ),
                      ]),
                      Row(children: <Widget>[
                        SizedBox(
                          width: 110,
                        ),
                        Container(
                          height: 35.0,
                          // ignore: deprecated_member_use
                          child: GFButton(
                            onPressed: () => setState(() {
                              isVisible4 = true;
                              isVisible5 = false;
                            }),
                            color: GFColors.SECONDARY,
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 35.0,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  uploadSelectedFile2();
                                  createVendorReg(
                                    //page 1
                                    search1,
                                    //page 2
                                    _controller0.text,
                                    int.parse(_controller1.text),
                                    _controller2.text,
                                    _controller3.text,
                                    int.parse(_controller4.text),
                                    _controller5.text,
                                    int.parse(_controller6.text),
                                    mondayCheck.toString(),
                                    tuesdayCheck.toString(),
                                    wednesdayCheck.toString(),
                                    thursdayCheck.toString(),
                                    fridayCheck.toString(),
                                    saturdayCheck.toString(),
                                    sundayCheck.toString(),
                                    search2,
                                    search3,
                                    //page 3
                                    _controller7.text,
                                    _controller8.text,
                                    _controller9.text,
                                    _controller10.text,
                                    _controller11.text,
                                    int.parse(_controller12.text),
                                    //page 4
                                    search4,
                                    search5,
                                    search6,
                                    search7,
                                    search8,
                                    search9,
                                    //page 5
                                    _controller13.text,
                                    search10,
                                    search11,
                                    search12,
                                    int.parse(_controller14.text),
                                    _controller15.text,
                                    _controller16.text,
                                    _controller17.text,
                                    _controller18.text,
                                    _controller19.text,
                                    //page 6
                                    search13,
                                    int.parse(_controller20.text),
                                  );
                                  createVendorReg2(
                                    //page 1
                                    search1,
                                    //page 2
                                    _controller0.text,
                                    int.parse(_controller1.text),
                                    _controller2.text,
                                    _controller3.text,
                                    int.parse(_controller4.text),
                                    _controller5.text,
                                    int.parse(_controller6.text),
                                    mondayCheck.toString(),
                                    tuesdayCheck.toString(),
                                    wednesdayCheck.toString(),
                                    thursdayCheck.toString(),
                                    fridayCheck.toString(),
                                    saturdayCheck.toString(),
                                    sundayCheck.toString(),
                                    search2,
                                    search3,
                                    //page 3
                                    _controller7.text,
                                    _controller8.text,
                                    _controller9.text,
                                    _controller10.text,
                                    _controller11.text,
                                    int.parse(_controller12.text),
                                    //page 4
                                    search4,
                                    search5,
                                    search6,
                                    search7,
                                    search8,
                                    search9,
                                    //page 5
                                    _controller13.text,
                                    search10,
                                    search11,
                                    search12,
                                    int.parse(_controller14.text),
                                    _controller15.text,
                                    _controller16.text,
                                    _controller17.text,
                                    _controller18.text,
                                    _controller19.text,
                                    //page 6
                                    search13,
                                    int.parse(_controller20.text),
                                  );
                                });
                                showAlertDialog(context);
                                _controller0.text = '';
                                _controller1.text = '';
                                _controller2.text = '';
                                _controller3.text = '';
                                _controller4.text = '';
                                _controller5.text = '';
                                _controller6.text = '';
                                objFile = null;
                                objFile2 = null;
                                mondayCheck = false;
                                tuesdayCheck = false;
                                wednesdayCheck = false;
                                thursdayCheck = false;
                                fridayCheck = false;
                                saturdayCheck = false;
                                sundayCheck = false;
                                objFile = null;
                                objFile2 = null;
                                _controller7.text = '';
                                _controller8.text = '';
                                _controller9.text = '';
                                _controller10.text = '';
                                _controller11.text = '';
                                _controller12.text = '';
                                _controller13.text = '';
                                _controller14.text = '';
                                _controller15.text = '';
                                _controller16.text = '';
                                _controller17.text = '';
                                _controller18.text = '';
                                _controller19.text = '';
                                _controller20.text = '';

                                Navigator.pushNamed(context, '/Login');
                              }
                            },
                            color: GFColors.DANGER,
                            child: Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        )
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ])
      ])), //Page 6 ends
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        if (constraints.maxWidth > 700) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width / 3),
          );
        }
      },
    );
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
    content: Text("Vendor Has Been Registered!"),
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
