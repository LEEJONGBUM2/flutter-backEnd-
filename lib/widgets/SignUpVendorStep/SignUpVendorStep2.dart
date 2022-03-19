// import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:iconnexz/SignUpVendorPage/SignUpVendorPage2.dart';
// import 'package:iconnexz/widgets/ActionButton/action_next_button.dart';

// class SignUpVendorStep2 extends StatefulWidget {
//   SignUpVendorStep2({Key? key}) : super(key: key);

//   @override
//   _SignUpVendorStep2State createState() => _SignUpVendorStep2State();
// }

// class _SignUpVendorStep2State extends State<SignUpVendorStep2> {
//   List<Widget> pageChildren(double width) {
//     return <Widget>[
//       Container(
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//             Column(children: <Widget>[
//               Row(
//                 children: [
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.grey,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('1'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Business \nType",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                     // Text(
//                     //   "Services",
//                     //   style: TextStyle(
//                     //       fontWeight: FontWeight.bold,
//                     //       fontSize: 28,
//                     //      color: Colors.black),
//                     // ),
//                   ]),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.black,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('2'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Business \nInformation",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                     //  Text(
//                     //    "Deliver",
//                     //   style: TextStyle(
//                     //        fontWeight: FontWeight.bold,
//                     //        fontSize: 28,
//                     //        color: Colors.black),
//                     //  ),
//                   ]),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.grey,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('3'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Vendor \nInformation",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                     //   Text(
//                     //     "Get Paid",
//                     //     style: TextStyle(
//                     //        fontWeight: FontWeight.bold,
//                     //         fontSize: 28,
//                     //         color: Colors.black),
//                     //   ),
//                   ]),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.grey,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('4'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Business \nCategory",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                   ]),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.grey,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('5'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Address\n",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                   ]),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Column(children: <Widget>[
//                     Container(
//                       width: 40,
//                       height: 30,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           shape: BoxShape.circle,
//                           border: new Border.all(
//                             color: Colors.grey,
//                             width: 2.5,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text('6'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Bank \nInformation",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w100,
//                           fontSize: 14,
//                           color: Colors.black),
//                     ),
//                   ]),
//                 ],
//               ),
//             ])
//           ])),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (
//         context,
//         constraints,
//       ) {
//         if (constraints.maxWidth > 700) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: pageChildren(constraints.biggest.width / 2),
//           );
//         } else {
//           return Column(
//             children: pageChildren(constraints.biggest.width / 3),
//           );
//         }
//       },
//     );
//   }
// }
