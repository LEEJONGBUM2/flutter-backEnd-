// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/SignUpVendorPage/SignUpsVendorPage.dart';
import 'package:iconnexz/VendorDashboard/Dashboard.dart';
import 'package:iconnexz/VendorLandingPage/chewie_list_item.dart';
import 'package:video_player/video_player.dart';

class VendorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(children: <Widget>[
      Container(
        height: width / 2.5,
        padding: EdgeInsets.symmetric(
          vertical: width / 30,
        ),
        color: Color(0xffD3D3D3),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(children: <Widget>[
            Text(
              "How it Works",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: width / 50,
                  color: Colors.black),
            ),
            Text(
              "Explore by choosing the services you are looking for",
              style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: width / 70,
                  color: Colors.black),
            ),
            SizedBox(
              height: width / 50,
            ),
            Row(
              children: [
                Column(children: <Widget>[
                  Container(
                    width: width / 6,
                    height: width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/list.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width / 50,
                  ),
                  Text(
                    "Step 1",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: width / 50,
                        color: Colors.black),
                  ),
                  Text(
                    "List Your Services",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width / 70,
                        color: Colors.black),
                  ),
                ]),
                SizedBox(
                  width: width / 8,
                ),
                Column(children: <Widget>[
                  Container(
                    width: width / 6,
                    height: width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/deliver.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width / 50,
                  ),
                  Text(
                    "Step 2",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: width / 50,
                        color: Colors.black),
                  ),
                  Text(
                    "Deliver Great Work",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width / 70,
                        color: Colors.black),
                  ),
                ]),
                SizedBox(
                  width: width / 8,
                ),
                Column(children: <Widget>[
                  Container(
                    width: width / 6,
                    height: width / 6,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/money.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width / 50,
                  ),
                  Text(
                    "Step 3",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: width / 50,
                        color: Colors.black),
                  ),
                  Text(
                    "Get Paid",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: width / 70,
                        color: Colors.black),
                  ),
                ]),
              ],
            ),
          ])
        ]),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          height: width / 5.4,
          color: Colors.white,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width / 1.7,
                  height: width / 1.2,
                  color: Color(0xffD3D3D3),
                  child: ChewieListItem(
                    videoPlayerController: VideoPlayerController.network(
                      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    ),
                    looping: true,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(children: <Widget>[
                  Text(
                    "Join our growing\ncommunity.             ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: width / 40,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Sell your services and earn income right now.\n We are here to help you grow your market\n and expand your services!",
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: width / 90,
                        color: Colors.black),
                  ),
                ])
              ])),
      SizedBox(
        height: 10,
      ),
      Container(
          color: Color(0xffD3D3D3),
          child: Column(children: <Widget>[
            Text(
              "Q&A",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 32,
                  color: Colors.black),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Column(children: <Widget>[
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title: 'How to become a vendor?\n',
                      content: 'Select become a vendor/merchant and register.'),
                ),
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title: 'What are the benefits of becoming a vendor?\n',
                      content:
                          'You can sell your services and start earning money. '),
                ),
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title: 'Why choose us?\n',
                      content:
                          'We can help expand your business and provide you with a platform to sell your services.'),
                ),
              ]),
              Column(children: <Widget>[
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title:
                          'Do vendors get there own dashboard to manage the services?',
                      content:
                          'Yes vendor get their own dashboard and can easily manage the services.'),
                ),
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title:
                          'What are some of the functions or options the vendors/merchants have?',
                      content:
                          'Vendors/Merchants can add/delete their services, create vouchers, check their product details, and send or receive transactions.'),
                ),
                Container(
                  width: width / 3,
                  child: GFAccordion(
                      title: 'Cant find the question your looking for!\n',
                      content:
                          'You can directly contact us by navigating to the contact us page.'),
                ),
              ]),
            ]),
            SizedBox(
              height: 10,
            ),
          ])),
      Container(
          height: width / 4,
          color: Colors.yellow,
          child: Row(children: <Widget>[
            SizedBox(width: 0),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              SizedBox(width: 10),
              Container(
                width: width / 2.5,
                height: width / 2.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pointing.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(children: <Widget>[
                SizedBox(height: width / 13),
                Text(
                  "Start now, it's completely free!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width / 60,
                      color: Colors.black),
                ),
                SizedBox(height: 23),
                Container(
                  height: width / 30,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignupsVendor');
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: width / 6.3, minHeight: width / 6.3),
                        alignment: Alignment.center,
                        child: Text(
                          "BECOME A MERCHANT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: width / 80),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ])
          ])),
    ]);
  }
}
