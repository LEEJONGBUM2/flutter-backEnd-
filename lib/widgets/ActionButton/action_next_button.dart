// import 'package:flutter/material.dart';
// import 'package:getwidget/colors/gf_color.dart';
// import 'package:getwidget/components/button/gf_button.dart';
// import 'package:iconnexz/SignUpVendorPage/SignUpVendorPage3.dart';

// class ActionNextButton extends StatelessWidget {
//   const ActionNextButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       width: 70,
//       //width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.pink,
//         //color: kPrimaryColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(25),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.pink.withOpacity(0.2),
//             spreadRadius: 4,
//             blurRadius: 7,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: GFButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SignUpVendorPage3()),
//           );
//         },
//         color: GFColors.SUCCESS,
//         child: Text(
//           'Next',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
