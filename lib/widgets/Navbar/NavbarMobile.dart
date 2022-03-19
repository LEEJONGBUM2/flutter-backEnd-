import 'package:flutter/material.dart';
import 'package:iconnexz/LandingPage/LandingPage.dart';
import 'package:iconnexz/widgets/Navbar/navbar_logo.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff042E44),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            onPressed: () {Scaffold.of(context).openDrawer();},
          ),
          NavBarLogo(press: () { Navigator.push(
            context,
             MaterialPageRoute(builder: (context) => LandingPage()),
            ); },),
        ],
      ),
    );
  }
}