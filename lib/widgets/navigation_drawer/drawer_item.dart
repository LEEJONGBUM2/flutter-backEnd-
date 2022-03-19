import 'package:flutter/material.dart';
import 'package:iconnexz/LandingPage/LandingPage.dart';
import 'package:iconnexz/widgets/Navbar/NavBarItem.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem(this.title, this.icon);

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
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
