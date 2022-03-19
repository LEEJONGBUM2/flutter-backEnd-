// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/OrdersModel.dart';
import 'package:iconnexz/Models/Table.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Orderss extends StatefulWidget {
  @override
  _Orders createState() => _Orders();
}

class _Orders extends State<Orderss> {
  int navIndex = 3;
   String searchTypeSelected = 'All';
  int? _sortColumnIndex;
  final _controller10 = TextEditingController();
  bool isAscending = false;

  var _dropdownValueOne = 5;

   userName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
   setState(() {
            _controller10.text = prefs.getString("UserName")!;
          });
  print(_controller10.text);
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

  List<Orders> _orders = [];
  final dateFrom = TextEditingController();
  final dateTo = TextEditingController();

  List<String> _columns = [
    "OrderId",
    "Order Status",
    'Customer',
    "Start Date",
    "End Date",
    "Order Total",
    "Action"
  ];

 @override
  void initState() {
   userName1();
    super.initState();
    userName();
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
  void dispose() {
    // Clean up the controller when the widget is removed
    dateFrom.dispose();
    dateTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double text = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
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
       itemBuilder:(context, index){
         return
           new Column(children: [
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: text / 400),
                                    Text('Orders',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: text / 70,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: text / 1.61),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: text / 140,
                                          )
                                        ])
                                  ]),
                              Divider(
                                height: 0,
                                thickness: 0,
                                indent: 0,
                                endIndent: 0,
                                color: Colors.white,
                              ),
                              SizedBox(height: text / 90),
                              Container(
                                width: text / 1,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: DataTable(
                                  columnSpacing: 5,
                                  headingRowHeight: 60,
                                  dataRowHeight: 100,
                                  dividerThickness: 2,
                                  columns: [
                                    DataColumn(
                                        label: Text('OrderId',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Order \nStatus',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Customer',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Created \nOn',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Order \nTotal',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                    DataColumn(
                                        label: Text('Actions',
                                            style: TextStyle(
                                                fontSize: 7.sp,
                                                fontWeight: FontWeight.bold))),
                                  ],
                                  rows: [
                                    DataRow(cells: <DataCell>[
                                      DataCell(
                                        Container(
                                          width: text / 8,
                                          padding: EdgeInsets.only(top: 9),
                                          height: height / 15,
                                          child: TextField(
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                              hintMaxLines: 1,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(Container(
                                        width: text / 8,
                                        height: height / 20,
                                        child: DropdownSearch<String>(
                                            mode: Mode.MENU,
                                            showSelectedItem: true,
                                            items: [
                                              "-Select-",
                                              "All",
                                              "New",
                                              "OnHold",
                                              "PendingPayment",
                                              "PaymentReceived",
                                              "PaymentFailed",
                                              "Invoiced",
                                              "Shipping",
                                              "Shipped",
                                              "Completed",
                                              "Canceled",
                                              "Refunded",
                                              "Closed",
                                              "OrderAccepted",
                                              "OrderPreparing",
                                              'ReadyForDelivery'
                                            ],
                                            popupItemDisabled: (String s) =>
                                                s.startsWith('-'),
                                            onChanged: print,
                                            selectedItem: "-Select-"),
                                      )),
                                      DataCell(
                                        Container(
                                          width: text / 8,
                                          height: height / 15,
                                          padding: EdgeInsets.only(top: 9),
                                          child: TextField(
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                              hintMaxLines: 1,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(Container(
                                          width: text / 10,
                                          height: text / 4,
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                TextField(
                                                  readOnly: true,
                                                  controller: dateFrom,
                                                  decoration: InputDecoration(
                                                      hintText: 'From'),
                                                  onTap: () async {
                                                    var date =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2100));
                                                    dateFrom.text = date
                                                        .toString()
                                                        .substring(0, 10);
                                                  },
                                                ),
                                                TextField(
                                                  readOnly: true,
                                                  controller: dateTo,
                                                  decoration: InputDecoration(
                                                      hintText: 'To'),
                                                  onTap: () async {
                                                    var date =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1900),
                                                            lastDate:
                                                                DateTime(2100));
                                                    dateTo.text = date
                                                        .toString()
                                                        .substring(0, 10);
                                                  },
                                                )
                                              ]))),
                                      DataCell(Text('')),
                                       DataCell(Row(
        children: [
          SizedBox(width: 20),
          InkWell(
            onTap: () {
              print('this is search button in table');
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(6)),
              child: Icon(
                FontAwesomeIcons.search,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),]),
                                    )
                                    ]),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                width: text / 1,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child:
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
                          ),),
                            ]))
                  ],
                ))
          ])
        ]);}));
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
      DataCell(Row(
        children: [
          InkWell(
            onTap: () { 
              updateOrders(_orders[index].orderId, "Active", _orders[index].vendor.toString(), _orders[index].customer.toString(),
              _orders[index].startDate.toString(), _orders[index].endDate.toString(), _orders[index].orderTotal.toString());
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.yellow, borderRadius: BorderRadius.circular(6)),
              child: Icon(
                FontAwesomeIcons.toggleOn,
                size: 14,
                color: Colors.black,
              ),
            ),
          ),
           SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () { 
              updateOrders(_orders[index].orderId, "Shipped", _orders[index].vendor.toString(), _orders[index].customer.toString(),
              _orders[index].startDate.toString(), _orders[index].endDate.toString(), _orders[index].orderTotal.toString());
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(6)),
              child: Icon(
                FontAwesomeIcons.shippingFast,
                size: 14,
                color: Colors.black,
              ),
            ),
          ),
           SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () { 
              updateOrders(_orders[index].orderId, "Cancelled", _orders[index].vendor.toString(), _orders[index].customer.toString(),
              _orders[index].startDate.toString(), _orders[index].endDate.toString(), _orders[index].orderTotal.toString());
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(6)),
              child: Icon(
                FontAwesomeIcons.ban,
                size: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      )),
    ]);
  }
}
