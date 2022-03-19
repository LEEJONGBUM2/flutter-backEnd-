import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/widgets/Footer/google_logo.dart';
import 'package:iconnexz/widgets/Footer/twitter_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iconnexz/Models/Service.dart';

import 'facebook_logo.dart';
import 'copyright_logo.dart';
import 'linkOne_logo.dart';
import 'linkTwo_logo.dart';

class Footer extends StatefulWidget {
  Footer({Key? key}) : super(key: key);
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final _controller10 = TextEditingController();

  userName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      _controller10.text = prefs.getString("UserName")!;
    });
    print(_controller10.text);
  }

  @override
  void initState() {
    super.initState();
    userName();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70.0,
        color: const Color(0xff052F44),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CopyRightLogo(
              press: () {},
            ),
            SizedBox(
              width: 20,
            ),
            LinkOneLogo(
              press: () {},
            ),
            SizedBox(
              width: 30,
            ),
            LinkTwoLogo(
              press: () {},
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white54,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: Text(_controller10.text),
                  ),
                  FacebookLogo(
                    press: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  TwitterLogo(
                    press: () {},
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GoogleLogo(
                    press: () {},
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class FooterItem extends StatelessWidget {
  final String title;
  const FooterItem(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}
