// ignore: file_names
// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/ActionButton/action_signup_button.dart';

class SignUpPageDesktopO extends StatefulWidget {
  SignUpPageDesktopO({Key? key}) : super(key: key);

  @override
  _SignUpPageDesktopOState createState() => _SignUpPageDesktopOState();
}

class _SignUpPageDesktopOState extends State<SignUpPageDesktopO> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword1 = false;
  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();
  final _controller7 = TextEditingController();
  final _controller8 = TextEditingController();
  final _controller9 = TextEditingController();
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Company Information",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.grey[700]),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 30,
                child: Divider(
                  color: Colors.orange,
                  //color: kPrimaryColor,
                  thickness: 4,
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isNotEmpty
                        ? null
                        : "Please Enter Company Name";
                  },
                  decoration: InputDecoration(
                    hintText: 'Company Name',
                    labelText: 'Company Name',
                    suffixIcon: Icon(
                      Icons.domain,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller1,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return value!.isNotEmpty
                        ? null
                        : "Please Enter Company Roc Number";
                  },
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp('[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Company Roc Number',
                    labelText: 'Company Roc Number',
                    suffixIcon: Icon(
                      Icons.dvr,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller2,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Please Enter Address";
                  },
                  decoration: InputDecoration(
                    hintText: 'Address',
                    labelText: 'Address',
                    suffixIcon: Icon(
                      Icons.event_note,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller3,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Please Enter Country";
                  },
                  decoration: InputDecoration(
                    hintText: 'Country',
                    labelText: 'Country',
                    suffixIcon: Icon(
                      Icons.flight_outlined,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller4,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Please Enter State";
                  },
                  decoration: InputDecoration(
                    hintText: 'State',
                    labelText: 'State',
                    suffixIcon: Icon(
                      Icons.festival_outlined,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller5,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Please Enter City";
                  },
                  decoration: InputDecoration(
                    hintText: 'City',
                    labelText: 'City',
                    suffixIcon: Icon(
                      Icons.emoji_transportation,
                    ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller6,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return value!.isNotEmpty ? null : "Please Enter Post Code";
                  },
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp('[0-9]')),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Post Code',
                    labelText: 'Post Code',
                    suffixIcon: Icon(
                      Icons.fact_check_outlined,
                    ),
                  ),
                ),
                width: 400,
              ),
            ],
          ),
        ),
      ),
      Container(
        width: width,
        alignment: Alignment(-0.8, -0.8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "User Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.grey[700]),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                width: 30,
                child: Divider(
                  color: Colors.orange,
                  //color: kPrimaryColor,
                  thickness: 4,
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _controller7,
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
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller8,
                  keyboardType: TextInputType.text,
                  obscureText: !_showPassword,
                  validator: (value) {
                    if ((value!.length > 5) && value.isNotEmpty) {
                      return null;
                    } else if ((value.length <= 5) && (value.length >= 1)) {
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
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    // suffixIcon: Icon(
                    //   Icons.lock_outline,
                    // ),
                  ),
                ),
                width: 400,
              ),
              Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if ((value!.length > 5) && value.isNotEmpty) {
                      return null;
                    } else if ((value.length <= 5) && (value.length >= 1)) {
                      return "Please write down the password at least 6 digit or character";
                    } else {
                      return "Please Enter Confirm Password";
                    }
                  },
                  obscureText: !_showPassword1,
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
                width: 400,
              ),
              Container(
                child: TextFormField(
                  controller: _controller9,
                  keyboardType: TextInputType.phone,
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
                  decoration: InputDecoration(
                    hintText: 'Contact Number',
                    labelText: 'Contact Number',
                    suffixIcon: Icon(
                      Icons.add_ic_call,
                    ),
                  ),
                ),
                width: 400,
              ),
              SizedBox(
                height: 10,
              ),
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
                          // ignore: prefer_const_literals_to_create_immutables
                          colors: [Color(0xff2555be), Color(0xff2625be)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 90.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Request OTP",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13),
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
                width: 400,
              ),

              SizedBox(
                height: 30,
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
                        createUserOrganization(
                            _controller.text,
                            int.parse(_controller1.text),
                            _controller2.text,
                            _controller3.text,
                            _controller4.text,
                            _controller5.text,
                            int.parse(_controller6.text),
                            _controller7.text,
                            _controller8.text,
                            _controller9.text);
                            createUserOrganization2(
                            _controller.text,
                            int.parse(_controller1.text),
                            _controller2.text,
                            _controller3.text,
                            _controller4.text,
                            _controller5.text,
                            int.parse(_controller6.text),
                            _controller7.text,
                            _controller8.text,
                            _controller9.text);
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
              //actionButton("Sign Up"),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: pageChildren(constraints.biggest.width / 2),
          );
        }
      },
    );
  }
}
