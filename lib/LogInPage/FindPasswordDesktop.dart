import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:iconnexz/LogInPage/LogInPage.dart';
import 'package:iconnexz/widgets/ActionButton/action_submit_button.dart';

class FindPasswordDesktop extends StatefulWidget {
  const FindPasswordDesktop(
      {Key? key,
      int? crossAxisCount,
      double? crossAxisSpacing,
      double? mainAxisSpacing,
      double? childAspectRatio})
      : super(key: key);

  @override
  _FindPasswordDesktopState createState() => _FindPasswordDesktopState();
}

class _FindPasswordDesktopState extends State<FindPasswordDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _showPassword1 = false;

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          bool isChecked = false;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          //   controller: _textEditingController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Temporary Password";
                          },

                          decoration: InputDecoration(
                            hintText: "Temporary Password",
                            labelText: "Temporary Password",
                            suffixIcon: Icon(
                              Icons.lock_outline,
                            ),
                          ),
                        ),
                        width: 360,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: !_showPassword,
                          //  controller: _textEditingController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter New Password";
                          },
                          decoration: InputDecoration(
                            hintText: "New Password",
                            labelText: "New Password",
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
                        width: 360,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: !_showPassword1,
                          //  controller: _textEditingController,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Please Enter Confirm New Password";
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm New Password",
                            labelText: "Confirm New Password",
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
                            //   Icons.lock_rounded,
                            // ),
                          ),
                        ),
                        width: 360,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Confirm"),
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked!;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              actions: <Widget>[
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.pushNamed(context, '/Login');
                    }
                  },
                  color: GFColors.INFO,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
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
                    ? 0.5
                    : size.height > 670
                        ? 0.6
                        : 0.7),
            width: 500,
            color: Colors.cyan[50],
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "CHANGE PASSWORD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        width: 30,
                        child: Divider(
                          color: Colors.pink,
                          //color: kPrimaryColor,
                          thickness: 4,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          labelText: 'Email Address',
                          suffixIcon: Icon(
                            Icons.mail_outline,
                          ),
                        ),
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
                          onPressed: () async {
                            await showInformationDialog(context);
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
                                  maxWidth: 180.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sending New Password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // TextField(
                      //keyboardType: TextInputType.emailAddress,
                      //  keyboardType: TextInputType.number,
                      //  inputFormatters: [
                      //    WhitelistingTextInputFormatter(RegExp('[0-9]')),
                      //  ],
                      //  decoration: InputDecoration(
                      //    hintText: 'Verification Code',
                      //    labelText: 'Verification Code',
                      //    suffixIcon: Icon(
                      //      Icons.contact_mail_outlined,
                      //    ),
                      //  ),
                      //  ),
                      //  SizedBox(
                      //    height: 10,
                      //  ),

                      ActionSubmitButton(),
                      //actionButton("Log In"),
                    ],
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
