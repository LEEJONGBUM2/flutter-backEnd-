import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/FaqModel.dart';

class FAQPage extends StatefulWidget {
  FAQPage({Key? key}) : super(key: key);

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<Faq> _faq = [];

  @override
  void initState() {
    fetchFaq().then((value) {
      setState(() {
        _faq.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: _faq == null ? 0 : (_faq.length > 1 ? 1 : _faq.length),
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Color(0xffD3D3D3),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                Text(
                  "Q&A",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 32,
                      color: Colors.black),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question1.toString(),
                            //title: 'What is Iconnexz Digital Service Mall?',
                            content: _faq[0].content1.toString(),
                            //'Iconnexz Digital Service Mall website is an e-commerce system that allows clients to purchase goods from sellers through a network infrastructure based on the concept of cyber markets. '
                          ),
                        ),
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question2.toString(),
                            //title: 'What is the history of the Iconnexz Company?',
                            content: _faq[0].content2.toString(),
                            //'ICONNEXZ (M) SDN. BHD company is a malaysian private limited company founded in 2018; The nature of business is to develop web applications, web portals, and data processing activities.'
                          ),
                        ),
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question3.toString(),
                            // title:
                            //     'What services do Iconnexz online shopping malls usually offer?',
                            content: _faq[0].content3.toString(),
                            //'the website has a location-based system to provide customized information to clients through their interests, purchase patterns, and consumption trends. In terms of functionality, the company presents intuitive designs through UX/UI development and specific designs such as user points, coupons, and merchandise transactions.'
                          ),
                        ),
                      ]),
                      Column(children: <Widget>[
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question4.toString(),
                            // title:
                            //     'What are the benefits of Iconnexz online shopping mall?',
                            content: _faq[0].content4.toString(),
                            //'(Location-Based Services)\nTo find the joy of real life beyond the purpose of simple information retrieval, users can choose the city where they are located and only the main services provided at that location are displayed on the website.\n\n(Chatbot Service)\nBefore the chatbot service is developed, you have to wait a long time after inquiring about the requirements through the bulletin board.\n\n(Electronic Payment Service)\nElectronic payment methods can be used on credit cards, online banking, and electronic payment portal sites such as PayPal and Stripe.'
                          ),
                        ),
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question5.toString(),
                            // title:
                            //     'What are the constraints of Iconnexz online shopping mall?',
                            content: _faq[0].content5.toString(),
                            //'(Location-Based Services)\nLocation-based systems have become an issue in terms of privacy violations.\n\n(Chatbot Service)\nDialog-based chatbots are only appropriate for customer consultation purposes, but they are not suitable for finding information or performing functions.\n\n(Electronic Payment Service)\nVirtual electronic payment systems on the Internet pose a dangerous problem.'
                          ),
                        ),
                        Container(
                          width: width / 3,
                          child: GFAccordion(
                            title: _faq[0].question6.toString(),
                            // title:
                            //     'What are the system requirements on the Iconnexz online shopping mall website?',
                            content: _faq[0].content6.toString(),
                            // 'Network-based businesses can reduce costs without time and space constraints, making new changes in distributors` environment and marketing strategies. With the introduction of digital shopping malls, public users tend to move to other shopping malls easily without feeling the burden or restraint of physical facility conversion costs.'
                          ),
                        ),
                      ]),
                    ]),
                SizedBox(
                  height: 10,
                ),
              ])));
        });
  }
}
