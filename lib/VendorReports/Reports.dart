import 'package:flutter/material.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:file_selector/file_selector.dart';
import 'package:iconnexz/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reports extends StatefulWidget {
  @override
  _Reports createState() => new _Reports();
}

class _Reports extends State<Reports> with SingleTickerProviderStateMixin {
  int navIndex = 7;
  bool isChecked = false;
  final _scrollController = ScrollController();
  late TabController _controller;
  final priceStart = TextEditingController();
  final priceEnd = TextEditingController();
  final thumbnail = TextEditingController();
  final thumbnail2 = TextEditingController();
  final _controller10 = TextEditingController();

   userName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
   setState(() {
            _controller10.text = prefs.getString("UserName")!;
          });
  print(_controller10.text);
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
  void initState() {
    super.initState();
    _controller = new TabController(length: 1, vsync: this);
    userName();
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
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: text / 1.24,
                                height: 1000,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 20),
                                                child: Text('Reports',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: text2 / 35,
                                                      color: Colors.white,
                                                    ))),
                                            new Container(
                                              decoration: new BoxDecoration(
                                                  color: Color(0xFF483D8B)),
                                              child: new TabBar(
                                                controller: _controller,
                                                labelStyle:
                                                    TextStyle(fontSize: 25),
                                                tabs: [
                                                  new Tab(
                                                    icon: const Icon(
                                                        Icons.date_range),
                                                    text: '2021',
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Container(
                                              height: 800.0,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: text / 40),
                                              child: new TabBarView(
                                                controller: _controller,
                                                children: <Widget>[
                                                  Container(
                                                      child: Column(
                                                          children: <Widget>[
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        SizedBox(height: 10),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7)),
                                                          width: 1000,
                                                          child: DataTable(
                                                            horizontalMargin: 1,
                                                            columns: [
                                                              DataColumn(
                                                                  label: Container(
                                                                      width:
                                                                          text /
                                                                              6,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Text(
                                                                          'Order Status',
                                                                          style: TextStyle(
                                                                              fontSize: text / 70,
                                                                              fontWeight: FontWeight.bold)))),
                                                              DataColumn(
                                                                  label: Container(
                                                                      width:
                                                                          text /
                                                                              6,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Text(
                                                                          'Number Of Order',
                                                                          style: TextStyle(
                                                                              fontSize: text / 70,
                                                                              fontWeight: FontWeight.bold)))),
                                                              DataColumn(
                                                                  label: Container(
                                                                      width:
                                                                          text /
                                                                              6,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child: Text(
                                                                          'Profit and Loss',
                                                                          style: TextStyle(
                                                                              fontSize: text / 70,
                                                                              fontWeight: FontWeight.bold)))),
                                                            ],
                                                            rows: [
                                                              DataRow(cells: [
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        'Completed',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        '1',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        'RM 0.0',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                              ]),
                                                              DataRow(cells: [
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        'Canceled',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        '1',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                                DataCell(Center(
                                                                    child: Text(
                                                                        'RM 0.0',
                                                                        style: TextStyle(
                                                                            fontSize: text2 /
                                                                                50,
                                                                            fontWeight:
                                                                                FontWeight.normal)))),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                      ])),
                                                ],
                                              ),
                                            ),
                                          ])
                                    ]))
                          ],
                        ))
                  ])
                ]))));
  }
}
