import 'package:flutter/material.dart';
import 'package:iconnexz/LogInPage/LogInPage.dart';
import 'package:iconnexz/widgets/Navbar/NavBarItem.dart';

class DrawerItem5 extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem5(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.grey[500]),
          SizedBox(
            width: 30,
          ),
          NavbarItem(
            title: title,
            press: () {
                  Navigator.pushNamed(context, '/Login');
                },
          )
        ],
      ),
    );
  }
}
