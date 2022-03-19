// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/ActionButton/action_signup_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPageDesktop extends StatefulWidget {
  SignUpPageDesktop({Key? key}) : super(key: key);

  @override
  _SignUpPageDesktopState createState() => _SignUpPageDesktopState();
}

class _SignUpPageDesktopState extends State<SignUpPageDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword1 = false;
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    final _controller1 = TextEditingController();
    final _controller2 = TextEditingController();
    final _controller3 = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Top section

          // Middle expanded
          Expanded(
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "User Account Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.grey[700],
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: Colors.orange,
                          //color: kPrimaryColor,
                          thickness: 4,
                        ),
                      ),
                      // Container(
                      //   child: TextField(
                      //    keyboardType: TextInputType.text,
                      //    decoration: InputDecoration(
                      //      hintText: 'Salutation',
                      //      labelText: 'Salutation',
                      //      suffixIcon: Icon(
                      //       Icons.supervised_user_circle_outlined,
                      //      ),
                      //     ),
                      //   ),
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      // ),
                      Container(
                        child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Full Name";
                          },
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            labelText: 'Full Name',
                            suffixIcon: Icon(
                              Icons.person_outline,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      // Container(
                      //   child: TextField(
                      //     keyboardType: TextInputType.datetime,
                      //     decoration: InputDecoration(
                      //       hintText: 'Date Of Birth',
                      //       labelText: 'Date Of Birth',
                      //       suffixIcon: Icon(
                      //         Icons.event_note,
                      //       ),
                      //     ),
                      //   ),
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      // ),

                      Container(
                        child: TextFormField(
                          controller: _controller1,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Email Address";
                          },
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            labelText: 'Email Address',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          controller: _controller2,
                          keyboardType: TextInputType.text,
                          obscureText: !_showPassword,
                          validator: (value) {
                            if ((value!.length > 5) && value.isNotEmpty) {
                              return null;
                            } else if ((value.length <= 5) &&
                                (value.length >= 1)) {
                              return "Please write down the password at least 6 digit or character";
                            } else {
                              return "Please Enter Password";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            // suffixIcon: Icon(
                            //   Icons.lock_outline,
                            // ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: !_showPassword1,
                          validator: (value) {
                            if ((value!.length > 5) && value.isNotEmpty) {
                              return null;
                            } else if ((value.length <= 5) &&
                                (value.length >= 1)) {
                              return "Please write down the password at least 6 digit or character";
                            } else {
                              return "Please Enter Confirm Password";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword1 = !_showPassword1;
                                });
                              },
                              child: Icon(
                                _showPassword1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            // suffixIcon: Icon(
                            //   Icons.password_outlined,
                            // ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Container(
                        child: TextFormField(
                          controller: _controller3,
                          keyboardType: TextInputType.phone,
                          //maxLength: 12,
                          validator: (value) {
                            //String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                            String patttern = r'(^(?:[+0][1-9])?[0-9]{10,12}$)';

                            RegExp regExp = new RegExp(patttern);
                            if (value!.length == 0) {
                              return 'Please enter mobile number';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Invalid Phone Number, Please enter valid mobile number';
                            }
                            return null;
                          },
                          // validator: (value) {
                          //   if ((value!.length > 5) && value.isNotEmpty) {
                          //     return null;
                          //   } else if ((value.length != 10)) {
                          //     return "Please fill out the contact number format";
                          //   } else {
                          //     return "Invalid Field";
                          //   }
                          // },
                          // inputFormatters: [
                          //   WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          // ],
                          decoration: InputDecoration(
                            hintText: 'Contact Number',
                            labelText: 'Contact Number',
                            suffixIcon: Icon(
                              Icons.add_ic_call,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   child: IntlPhoneField(
                      //     decoration: InputDecoration(
                      //       labelText: 'Phone Number',
                      //       border: OutlineInputBorder(
                      //         borderSide: BorderSide(),
                      //       ),
                      //     ),
                      //     initialCountryCode: 'MY',
                      //     onChanged: (phone) {
                      //       print(phone.completeNumber); //get complete number
                      //       print(phone.countryCode); // get country code only
                      //       print(phone.number); // only phone number
                      //     },
                      //   ),
                      //   width: MediaQuery.of(context).size.width * 0.5,
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Container(
                        height: 35.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {},
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff2555be),
                                    Color(0xff2625be)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 90.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Request OTP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Verification Code";
                          },
                          inputFormatters: [
                            WhitelistingTextInputFormatter(RegExp('[0-9]')),
                          ],
                          decoration: InputDecoration(
                            hintText: 'VerificationCode',
                            labelText: 'VerificationCode',
                            suffixIcon: Icon(
                              Icons.enhanced_encryption_outlined,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 280,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          //color: kPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: GFButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                createUserIndividual(
                                    _controller.text,
                                    _controller1.text,
                                    _controller2.text,
                                    _controller3.text);
                                    createUserIndividual2(
                                    _controller.text,
                                    _controller1.text,
                                    _controller2.text,
                                    _controller3.text);
                              });
                              Navigator.pushNamed(context, '/Login');
                            }
                          },
                          color: GFColors.SUCCESS,
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
              ])),
          //color: Colors.blueGrey[100],
          // Bottom Section
        ],
      ),
    );
  }
}
