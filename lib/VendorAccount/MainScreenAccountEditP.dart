// import 'package:flutter/material.dart';
// import 'package:iconnexz/Models/AccountInfo.dart';
// import 'package:iconnexz/Models/BankInformation.dart';

// import 'package:iconnexz/Models/BusinessInfo.dart';
// import 'package:iconnexz/Models/VendorAddress.dart';
// import 'package:iconnexz/VendorAccount/VendorAccountEditP.dart';
// import 'package:iconnexz/components/sidebar.dart';
// import 'package:iconnexz/components/sidebar_mobile.dart';
// import 'package:iconnexz/controllers/MenuController.dart';
// import 'package:iconnexz/responsive.dart';
// import 'package:provider/provider.dart';

// class MainScreenAccountEdit extends StatefulWidget {
//   late final BusinessInfo businessInfo;
//   late final AccountInfo accountInfo;
//   late final VendorAddress vendorAddress;
//   late final BankInformation bankInformation;

//   // const MainScreenAccountEdit({
//   //   Key? key,
//   //   required this.businessInfo,
//   //   required this.accountInfo,
//   //   required this.vendorAddress,
//   //   required this.bankInformation,
//   // }) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState(this.businessInfo, this.accountInfo,
//       this.vendorAddress, this.bankInformation);
// }

// class _HomeState extends State<MainScreenAccountEdit> {
//   int navIndex = 1;
//   late final BusinessInfo businessInfo;
//   late final AccountInfo accountInfo;
//   late final VendorAddress vendorAddress;
//   late final BankInformation bankInformation;

//   _HomeState(BusinessInfo businessInfo, AccountInfo accountInfo,
//       VendorAddress vendorAddress, BankInformation bankInformation);
//   @override
//   void initState() {
//     super.initState();
//     businessInfo = widget.businessInfo;
//     accountInfo = widget.accountInfo;
//     vendorAddress = widget.vendorAddress;
//     bankInformation = widget.bankInformation;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<MenuController>().scaffoldKey,
//       drawer: Sidenav(navIndex, (int index) {
//         setState(() {
//           navIndex = index;
//         });
//       }),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // We want this side menu only for large screen
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 // default flex = 1
//                 // and it takes 1/6 part of the screen
//                 child: Sidenav(navIndex, (int index) {
//                   setState(() {
//                     navIndex = index;
//                   });
//                 }),
//               ),
//             if (Responsive.isMobile(context))
//               Container(
//                 width: 60,
//                 // default flex = 1
//                 // and it takes 1/6 part of the screen
//                 child: SidenavMobile(navIndex, (int index) {
//                   setState(() {
//                     navIndex = index;
//                   });
//                 }),
//               ),
//             Expanded(
//               // It takes 5/6 part of the screen
//               flex: 5,
//               child: VendorAccountEdit(
//                 businessInfo: businessInfo,
//                 accountInfo: accountInfo,
//                 vendorAddress: vendorAddress,
//                 bankInformation: bankInformation,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
