// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_new

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/AccountInfo.dart';
import 'package:iconnexz/Models/BankInformation.dart';
import 'package:iconnexz/Models/BusinessInfo.dart';
import 'package:iconnexz/Models/Service.dart';
import 'package:iconnexz/Models/Table.dart';
import 'package:iconnexz/Models/VendorAddress.dart';
import 'package:iconnexz/VendorAccount/MainScreenAccountEdit.dart';
import 'package:iconnexz/VendorManageService/MainScreenUpdate.dart';
import 'package:iconnexz/VendorManageService/UpdateService.dart';
import 'package:iconnexz/components/sidebar.dart';
import 'package:iconnexz/constants.dart';
import 'package:iconnexz/controllers/MenuController.dart';
import 'package:one_context/one_context.dart';
import 'package:iconnexz/responsive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class UpdatedVendorAccount extends StatefulWidget {
  @override
  _UpdatedVendorAccount createState() => _UpdatedVendorAccount();
}

class _UpdatedVendorAccount extends State<UpdatedVendorAccount> {
  int navIndex = 1;
  String searchTypeSelected = 'All';
  int? _sortColumnIndex;
  bool isAscending = false;
  final _controller10 = TextEditingController();

  var _dropdownValueOne = 5;

  userName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      _controller10.text = prefs.getString("UserName")!;
    });
    print(_controller10.text);
  }

  List<BusinessInfo> _businessInfo = [];
  // List<AccountInfo> _accountInfo = [];
  //List<VendorAddress> _vendorAddress = [];
  //List<BankInformation> _bankInformation = [];
  @override
  void initState() {
    fetchBusinessInfo().then((value) {
      setState(() {
        //_businessInfo.addAll(value);
        _businessInfo.addAll(value);
      });
    });
    // fetchAccountInfo().then((value) {
    //   setState(() {
    //     //_service.addAll(value);
    //     _accountInfo.addAll(value);
    //   });
    // });
    // fetchVendorAddress().then((value) {
    //   setState(() {
    //     //_service.addAll(value);
    //     _vendorAddress.addAll(value);
    //   });
    // });
    // fetchBankInformation().then((value) {
    //   setState(() {
    //     //_service.addAll(value);
    //     _bankInformation.addAll(value);
    //   });
    // });
    super.initState();
    userName();
  }

  List<String> _columns1 = [
    //"Mobile Contact Number",
    "Company Description",
    "Business Start Time",
    // "Business Finish Time",
    // "Person In Charge Name",
    // "Phone Number",
    "Vendor Email",
    // "Vendor Address",
    "Country",
    // "State",
    // "City",
    "Post Code",
    // "Business Latitude",
    // "Business Longitude",
    // "Bank Name",
    "Account Number",
    "IsPublished",
    "Action"
  ];

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

  final dateFrom = TextEditingController();
  final dateTo = TextEditingController();

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
        body: SingleChildScrollView(
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
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: text / 400),
                                    Text('Manage Vendor Account',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: text / 70,
                                          color: Colors.white,
                                        )),
                                    SizedBox(width: text / 1.61),
                                    // Column(
                                    //     crossAxisAlignment:
                                    //         CrossAxisAlignment.start,
                                    //     children: [
                                    //       SizedBox(height: text / 80),
                                    //       Container(
                                    //         width: text / 8.4,
                                    //         height: text / 60,
                                    //         // ignore: deprecated_member_use
                                    //         child: RaisedButton(
                                    //           onPressed: () {
                                    //             Navigator.pushNamed(
                                    //                 context, '/CreateService');
                                    //           },
                                    //           shape: RoundedRectangleBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(
                                    //                       6.0)),
                                    //           padding: EdgeInsets.all(0.0),
                                    //           child: Ink(
                                    //             decoration: BoxDecoration(
                                    //                 color: Color(0xFF483D8B),
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(
                                    //                         6.0)),
                                    //             child: Container(
                                    //                 constraints: BoxConstraints(
                                    //                     maxWidth: text / 8.2,
                                    //                     minHeight: text / 6.2),
                                    //                 alignment: Alignment.center,
                                    //                 child: Row(
                                    //                     crossAxisAlignment:
                                    //                         CrossAxisAlignment
                                    //                             .start,
                                    //                     children: [
                                    //                       Icon(
                                    //                         Icons.add,
                                    //                         size: text / 60,
                                    //                         color: Colors.white,
                                    //                       ),
                                    //                       SizedBox(
                                    //                         width: text / 400,
                                    //                       ),
                                    //                       Text(
                                    //                         "Create Services",
                                    //                         textAlign: TextAlign
                                    //                             .center,
                                    //                         style: TextStyle(
                                    //                             color: Colors
                                    //                                 .white,
                                    //                             fontSize:
                                    //                                 text / 90),
                                    //                       ),
                                    //                     ])),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       SizedBox(
                                    //         height: text / 140,
                                    //       )
                                    //     ])
                                  ]),
                              SizedBox(height: 5),
                              Container(
                                width: text / 1,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: PaginatedDataTable(
                                    header: Row(children: [
                                      Text(_businessInfo.length.toString(),
                                          style: TextStyle(
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.bold)),
                                      Text(' Vendor Account found',
                                          style: TextStyle(
                                              fontSize: 7.sp,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    source: SourceData(
                                      _businessInfo,
                                      // _accountInfo,
                                      // _bankInformation,
                                      // _vendorAddress
                                    ),
                                    showFirstLastButtons: true,
                                    sortAscending: isAscending,
                                    sortColumnIndex: _sortColumnIndex,
                                    rowsPerPage: 1,
                                    showCheckboxColumn: false,
                                    columns: _columns1
                                        .map(
                                          (value) => DataColumn(
                                              onSort: _onSort,
                                              label: Text(
                                                value,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: text / 1,
                              //   decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       borderRadius: BorderRadius.circular(7)),
                              //   padding: EdgeInsets.symmetric(vertical: 10),
                              //   child: DataTable(
                              //     columnSpacing: 5,
                              //     headingRowHeight: 40,
                              //     dividerThickness: 2,
                              //     columns: [
                              //       DataColumn(
                              //           label: Text('0 records found',
                              //               style: TextStyle(
                              //                   fontSize: 7.sp,
                              //                   fontWeight: FontWeight.bold))),
                              //       DataColumn(label: Text('')),
                              //       DataColumn(label: Text('')),
                              //       DataColumn(label: Text('')),
                              //       DataColumn(label: Text('')),
                              //       DataColumn(label: Text('')),
                              //     ],
                              //     rows: [
                              //       DataRow(cells: [
                              //         DataCell(Text('')),
                              //         DataCell(Text('')),
                              //         DataCell(Text('')),
                              //         DataCell(Text('')),
                              //         DataCell(Text('')),
                              //         DataCell(Text('')),
                              //       ]),
                              //     ],
                              //   ),
                              // ),
                            ]))
                  ],
                ))
          ])
        ])));
  }
}

class SourceData extends DataTableSource {
  SourceData(
    this._businessInfo,
    // this._accountInfo,
    // this._bankInformation,
    //this._vendorAddress,
  );
  List<BusinessInfo> _businessInfo = [];
  // List<AccountInfo> _accountInfo = [];
  // List<BankInformation> _bankInformation = [];
  // List<VendorAddress> _vendorAddress = [];
  bool get isRowCountApproximate => false;
  int get rowCount => _businessInfo.length;
  // int get rowCount1 => _accountInfo.length;
  // int get rowCount2 => _bankInformation.length;
  // int get rowCount3 => _vendorAddress.length;
  int get selectedRowCount => 0;
  DataRow getRow(int index) {
    return DataRow(cells: [
      // DataCell(Text(_businessInfo[index].contactNumber.toString())),
      DataCell(Text(_businessInfo[index].companyDescription.toString())),
      DataCell(Text(_businessInfo[index].businessStartTime.toString())),
      //  DataCell(Text(_businessInfo[index].businessFinishTime.toString())),
      //  DataCell(Text(_businessInfo[index].personInChargeName.toString())),
      //  DataCell(Text(_businessInfo[index].phoneNumber.toString())),
      DataCell(Text(_businessInfo[index].vendorEmail.toString())),
      //  DataCell(Text(_businessInfo[index].vendorAddress.toString())),
      DataCell(Text(_businessInfo[index].country.toString())),
      //  DataCell(Text(_businessInfo[index].state.toString())),
      //  DataCell(Text(_businessInfo[index].city.toString())),
      DataCell(Text(_businessInfo[index].postCode.toString())),
      //  DataCell(Text(_businessInfo[index].businessLatitude.toString())),
      //  DataCell(Text(_businessInfo[index].businessLongitude.toString())),
      //  DataCell(Text(_businessInfo[index].bankName.toString())),
      DataCell(Text(_businessInfo[index].accountNumber.toString())),
      DataCell(Text(_businessInfo[index].isPublished4.toString())),
      DataCell(Row(
        children: [
          InkWell(
            onTap: () {
              OneContext().pushReplacement(MaterialPageRoute(
                builder: (_) => MultiProvider(
                  providers: [
                    ChangeNotifierProvider(
                      create: (context) => MenuController(),
                    ),
                  ],
                  child: MainScreenAccountEdit(
                    businessInfo: _businessInfo[index],
                    // accountInfo: _accountInfo[index],
                    // bankInformation: _bankInformation[index],
                    //vendorAddress: _vendorAddress[index],
                  ),
                ),
              ));
            },
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: Colors.yellow, borderRadius: BorderRadius.circular(6)),
              child: Icon(
                FontAwesomeIcons.pen,
                size: 14,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          // InkWell(
          //   onTap: () {
          //     deleteServiceImage(_service[index].serviceId);
          //     deleteService(_service[index].serviceId);
          //     deleteServiceVariation(_service[index].serviceId);
          //     deleteServiceMapping(_service[index].serviceId);
          //   },
          //   child: Container(
          //     height: 32,
          //     width: 32,
          //     decoration: BoxDecoration(
          //         color: Colors.red, borderRadius: BorderRadius.circular(6)),
          //     child: Icon(
          //       FontAwesomeIcons.trashAlt,
          //       size: 14,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      )),
    ]);
  }
}
