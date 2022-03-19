// ignore_for_file: file_names, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/LogInPage/FindPassword.dart';
import 'package:iconnexz/LogInPage/LogInItem.dart';
import 'package:iconnexz/SignUpPage/SignUpPageI.dart';
import 'package:iconnexz/widgets/ActionButton/action_login_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPageDesktop extends StatefulWidget {
  LogInPageDesktop({Key? key}) : super(key: key);

  @override
  _LogInPageDesktopState createState() => _LogInPageDesktopState();
}

class _LogInPageDesktopState extends State<LogInPageDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _controller1 = TextEditingController();
    final _controller2 = TextEditingController();

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(size.height > 770
            ? 64
            : size.height > 670
                ? 32
                : 16),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: size.height *
                  (size.height > 770
                      ? 0.7
                      : size.height > 670
                          ? 0.8
                          : 0.9),
              width: 500,
              color: Colors.cyan[50],
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "LOG IN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 30,
                          child: Divider(
                            color: Colors.green,
                            //color: kPrimaryColor,
                            thickness: 4,
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          controller: _controller1,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Email";
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            suffixIcon: Icon(
                              Icons.mail_outline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        TextFormField(
                          controller: _controller2,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Plaese Enter Password";
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            LogInItem(
                              title: "Forgot Password",
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FindPassword()),
                                );
                              },
                            ),
                          ],
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
                                  signIn(_controller1.text, _controller2.text).then((value) => { 
                                    setState(() async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  int? userType = prefs.getInt('UserType');
                                  print(userType);
                                            if (value == 200)
                                          {
                                            if (userType == 1)
                                            {
                                              Navigator.pushNamed(context, '/');
                                            }
                                            if (userType == 2)
                                            {
                                              Navigator.pushNamed(context, '/');
                                            }
                                            if (userType == 3)
                                            {
                                              Navigator.pushNamed(context, '/Dashboard');
                                            }
                                            
                                          }
                                          if (value == 422)
                                          {
                                            showAlertDialog(context);
                                          }
                                  })});
                                });
                              }
                            },
                            color: GFColors.INFO,
                            // ignore: prefer_const_constructors
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 35.0,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                padding: EdgeInsets.all(0.0),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                  );
                                },
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
                                        maxWidth: 80.0, minHeight: 35.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Try Again"),
    onPressed:  () {Navigator.of(context).pop();},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text("Incorrect Username or Password!"),
    actions: [
      remindButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}