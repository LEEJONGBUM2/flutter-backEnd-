import 'package:animate_do/animate_do.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';

class ShoppingCart2 extends StatefulWidget {
  @override
  _ShoppingCart2 createState() => _ShoppingCart2();
}

class _ShoppingCart2 extends State<ShoppingCart2> {
  String _verticalGroupValue = "Pending";
  String _verticalGroupValue2 = "Pending";

  bool isVisible = false;
  bool isVisible2 = false;

  List<String> _status = [
    "Self-Collect",
    "Default Address",
    "Deliver to New Address"
  ];
  List<String> _status2 = [
    "Cash On Delivery (COD)",
    "PayPal Express",
    "Stripe (Pay With Card)"
  ];
  @override
  Widget build(BuildContext context) {
    const white = Color(0xFFFFFFFF);
    return Scaffold(
      drawer: NavigationDrawer(),
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    const white = Color(0xFFFFFFFF);
    const black = Color(0xFF000000);
    const grey = Color(0xffEFEFEF);
    double text = MediaQuery.of(context).size.width;
    var _scrollController;
    return Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Navbar(),
                Padding(
                  padding:
                      EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 0),
                  child: Text(
                    "Address and Payment",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(thickness: 2),
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: text / 10, right: text / 10, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 0, right: 0, bottom: 0),
                          child: Text(
                            "Select Address",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: grey,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0.5,
                                    color: black.withOpacity(0.1),
                                    blurRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 15),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      RadioGroup<String>.builder(
                                        groupValue: _verticalGroupValue,
                                        onChanged: (value) => setState(() {
                                          isVisible2 = true;
                                          _verticalGroupValue = value!;
                                          if (value ==
                                              "Deliver to New Address") {
                                            isVisible = true;
                                          } else {
                                            isVisible = false;
                                          }
                                        }),
                                        items: _status,
                                        itemBuilder: (item) =>
                                            RadioButtonBuilder(
                                          item,
                                        ),
                                        activeColor: Color(0xff042E44),
                                      ),
                                      Visibility(
                                          visible: isVisible,
                                          child: Container(
                                              alignment: Alignment.center,
                                              width: 1300,
                                              height: 380,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: text / 8),
                                                  child:
                                                      Column(children: <Widget>[
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "Recipent :         ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                          width: text / 3,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Enter Name',
                                                            ),
                                                          ))
                                                    ]),
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "Address :          ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                          width: text / 3,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText:
                                                                  'Enter Location',
                                                            ),
                                                          ))
                                                    ]),
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "Country :           ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                        width: text / 3,
                                                        child: DropdownSearch<
                                                                String>(
                                                            mode: Mode.MENU,
                                                            showSelectedItem:
                                                                true,
                                                            items: ['Malaysia'],
                                                            onChanged: print,
                                                            selectedItem: ""),
                                                      )
                                                    ]),
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "State :                 ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                        width: text / 3,
                                                        child: DropdownSearch<
                                                                String>(
                                                            mode: Mode.MENU,
                                                            showSelectedItem:
                                                                true,
                                                            items: [
                                                              "Johor",
                                                              "Selangor",
                                                              "Federal Territories",
                                                              "Malacca",
                                                              "Negeri Sembilan",
                                                              "Penang",
                                                              "Perak",
                                                              'Sabah'
                                                            ],
                                                            onChanged: print,
                                                            selectedItem: ""),
                                                      )
                                                    ]),
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "City :                   ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                          width: text / 3,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText: '',
                                                            ),
                                                          ))
                                                    ]),
                                                    SizedBox(height: 10),
                                                    Row(children: <Widget>[
                                                      Text(
                                                        "Postal Code :   ",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Container(
                                                          width: text / 3,
                                                          child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              labelText: '',
                                                            ),
                                                          ))
                                                    ]),
                                                  ]))))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Divider(thickness: 2),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 0, right: 0, bottom: 0),
                          child: Text(
                            "Select Payment",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: grey,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.5,
                                      color: black.withOpacity(0.1),
                                      blurRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 15, right: 15, bottom: 15),
                              child: Visibility(
                                visible: isVisible2,
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Column(children: <Widget>[
                                        RadioGroup<String>.builder(
                                          groupValue: _verticalGroupValue2,
                                          onChanged: (value) => setState(() {
                                            _verticalGroupValue2 = value!;
                                          }),
                                          items: _status2,
                                          itemBuilder: (item) =>
                                              RadioButtonBuilder(
                                            item,
                                          ),
                                          activeColor: Color(0xff042E44),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ]),
                Container(
                  height: 35.0,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        createOrders(
                          "Pending",
                          "Shahryar004",
                          "Mr.alex",
                          "01/11/2021",
                          "22/11/2021",
                          "RM22.00",
                        );
                      });
                      Navigator.pushNamed(context, '/');
                    },
                    color: GFColors.DANGER,
                    child: Text(
                      'Confirm Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(thickness: 2),
                SizedBox(height: 220),
                Footer()
              ],
            )));
  }
}
