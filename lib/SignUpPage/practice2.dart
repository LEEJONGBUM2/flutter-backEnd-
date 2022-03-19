// import 'package:flutter/material.dart';
// import 'package:international_phone_input/international_phone_input.dart';

// class MyHomePage2 extends StatefulWidget {
//   @override
//   _MyHomePage2State createState() => _MyHomePage2State();
// }

// class _MyHomePage2State extends State<MyHomePage2> {
//   late String phoneNumber;
//   late String phoneIsoCode;
//   bool visible = false;
//   String confirmedNumber = '';

//   void onPhoneNumberChange(
//       String number, String internationalizedPhoneNumber, String isoCode) {
//     print(number);
//     setState(() {
//       phoneNumber = number;
//       phoneIsoCode = isoCode;
//     });
//   }

//   onValidPhoneNumber(
//       String number, String internationalizedPhoneNumber, String isoCode) {
//     setState(() {
//       visible = true;
//       confirmedNumber = internationalizedPhoneNumber;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Spacer(flex: 1),
//             InternationalPhoneInput(
//               onPhoneNumberChange: onPhoneNumberChange,
//               initialPhoneNumber: phoneNumber,
//               initialSelection: phoneIsoCode,
//               enabledCountries: ['+233', '+1'],
//               labelText: "Phone Number",
//             ),
//             SizedBox(height: 20),
//             InternationalPhoneInput(
//               decoration: InputDecoration.collapsed(hintText: '(123) 123-1234'),
//               onPhoneNumberChange: onPhoneNumberChange,
//               initialPhoneNumber: phoneNumber,
//               initialSelection: phoneIsoCode,
//               enabledCountries: ['+233', '+1'],
//               showCountryCodes: false,
//               showCountryFlags: true,
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               height: 1,
//               color: Colors.black,
//             ),
//             SizedBox(height: 50),
//             InternationalPhoneInputText(
//               onValidPhoneNumber: onValidPhoneNumber,
//             ),
//             Visibility(
//               child: Text(confirmedNumber),
//               visible: visible,
//             ),
//             Spacer(flex: 2)
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
