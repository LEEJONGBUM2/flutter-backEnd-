import 'dart:js';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:iconnexz/widgets/Footer/footer.dart';
import 'package:iconnexz/widgets/Navbar/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/navigation_drawer.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const white = Color(0xFFFFFFFF);
    const black = Color(0xFF000000);
    const grey = Color(0xffEFEFEF);
    return Scaffold(
        drawer: NavigationDrawer(),
        backgroundColor: white,
        body: Builder(builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              Navbar(),
              Padding(
                padding:
                    EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 0),
                child: Text(
                  "Shopping Cart",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Divider(thickness: 2),
              SizedBox(height: 20),
              Column(
                children: List.generate(2, (index) {
                  return FadeInDown(
                    duration: Duration(milliseconds: 350 * index),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 30),
                      child: Row(
                        children: <Widget>[
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
                                    child: Container(
                                      width: 170,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "" + products[index]['img']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                products[index]['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "RM " + products[index]['price'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "x1",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: black.withOpacity(0.5),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(thickness: 2),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 200,
                      child: Text(
                        "Select Shipping:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                        width: 200,
                        child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItem: true,
                            items: ["PosLaju: RM 5", "Self-Collect"],
                            onChanged: print,
                            selectedItem: "Self-Collect")),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        width: 200,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Coupon Code',
                          ),
                        )),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: black,
                        onPressed: () {},
                        child: Container(
                          width: 150,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "RM 22.00",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: black,
                    onPressed: () {
                      Navigator.pushNamed(context, '/Payment');
                    },
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )),
              ),
              Footer()
            ],
          );
        }));
  }

  List products = [
    {
      "id": 1,
      "img": "assets/images/ChickenRice/1.jpg",
      "name": "BBQ Chicken Rice",
      "price": "12.00",
      "mul_img": [],
    },
    {
      "id": 2,
      "img": "assets/images/ChickenRice/2.jpg",
      "name": "Haineese Chicken Rice",
      "price": "10.00",
      "mul_img": [],
    }
  ];
}
