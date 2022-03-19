// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/OrdersModel.dart';
import 'package:iconnexz/Models/Table.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/header.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Dashboard> {
  int navIndex = 0;
  String searchTypeSelected = 'All';
  int? _sortColumnIndex;
  bool isAscending = false;
  List<Orders> _orders = [];
  final _controller1 = TextEditingController();

   userName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
   setState(() {
            _controller1.text = prefs.getString("UserName")!;
          });
  print(_controller1.text);
}

userName1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
    fetchOrders(
      prefs.getString("UserName")!
    ).then((value) {
      setState(() {
        _orders.addAll(value);
      });
    });
}

  var _dropdownValueOne = 5;

  List<String> _columns = [
    "OrderId",
    "Order Status",
    'Customer',
    "Start Date",
    "End Date",
    "Order Total"
  ];

  @override
  void initState()  {
    userName1();
    userName();
    super.initState();
  }

  void _onSort(int columnIndex, bool ascending) {
    if (columnIndex < 5) {
      rowData1.sort((data1, data2) => ascending
          ? data1[columnIndex].compareTo(data2[columnIndex])
          : data2[columnIndex].compareTo(data1[columnIndex]));

      setState(() {
        this._sortColumnIndex = columnIndex;
        this.isAscending = ascending;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double text2 = MediaQuery.of(context).size.width;
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
                        child: Text(_controller1.text),
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
        body: ListView.builder(
                itemCount: _orders == null
                    ? 0
                    : (_orders.length > 1 ? 1 : _orders.length),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: defaultPadding),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 29,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     Container(
                        margin: EdgeInsets.only(bottom: 20, left: 50, right: 50),
                        width: double.infinity,
                        child:Card(child: Column(children: [
                          ListTile(
                            title: Text(
                              "Latest Orders",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  wordSpacing: 2),
                            ),
                          ),
                          Divider(
                              // indent: 3,
                              ),
                          ListTile(
                            title: PaginatedDataTable(
                              header:  Row(children: [
                                             Text(_orders.length.toString(),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 fontWeight: FontWeight.bold)),
                                                 Text(' orders found',
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 fontWeight: FontWeight.bold))]),
                              source: SourceData(_orders),
                              showFirstLastButtons: true,
                              sortAscending: isAscending,
                              sortColumnIndex: _sortColumnIndex,
                              rowsPerPage: 10,
                              showCheckboxColumn: false,
                              columns: _columns
                                  .map(
                                    (value) => DataColumn(
                                        onSort: _onSort,
                                        label: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                  .toList(),
                            ),
                          )
                        ]),
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20, left: 50, right: 50),
                        width: double.infinity,
                        child:Card(child: Column(children: [
                          ListTile(
                            title: Text(
                              "Most Popular Services",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                  wordSpacing: 2),
                            ),
                          ),
                          Divider(
                              // indent: 3,
                              ),
                          ListTile(
                            title: PaginatedDataTable(
                              header:  Row(children: [
                                             Text(_orders.length.toString(),
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 fontWeight: FontWeight.bold)),
                                                 Text(' orders found',
                                             style: TextStyle(
                                                 fontSize: 7.sp,
                                                 fontWeight: FontWeight.bold))]),
                              source: SourceData(_orders),
                              showFirstLastButtons: true,
                              sortAscending: isAscending,
                              sortColumnIndex: _sortColumnIndex,
                              rowsPerPage: 10,
                              showCheckboxColumn: false,
                              columns: _columns
                                  .map(
                                    (value) => DataColumn(
                                        onSort: _onSort,
                                        label: Text(
                                          value,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                  .toList(),
                            ),
                          )
                        ]),
                      ),
                      ),
                      ],
                      
                ))
          ])
        ]));}));
  }
}

class SourceData extends DataTableSource {
  SourceData(this._orders);
  List<Orders> _orders = [];
  bool get isRowCountApproximate => false;
  int get rowCount => _orders.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_orders[index].orderId.toString())),
      DataCell(Text(_orders[index].orderStatus.toString())),
      DataCell(Text(_orders[index].customer.toString())),
      DataCell(Text(_orders[index].startDate.toString())),
      DataCell(Text(_orders[index].endDate.toString())),
      DataCell(Text(_orders[index].orderTotal.toString())),
    ]);
  }
}