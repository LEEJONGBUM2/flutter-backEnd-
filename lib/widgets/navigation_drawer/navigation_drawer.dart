import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Navbar.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item2.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item3.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item4.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item5.dart';
import 'package:iconnexz/widgets/navigation_drawer/drawer_item6.dart';

import 'drawer_item7.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<Navbar> _navbar = [];

  @override
  void initState() {
    fetchNavbar().then((value) {
      setState(() {
        _navbar.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          _navbar == null ? 0 : (_navbar.length / 2 > 1 ? 1 : _navbar.length),
      shrinkWrap: true,
      //   // scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 80,
          decoration: BoxDecoration(
            color: Color(0xff042E44),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 16),
            ],
          ),
          child: Column(
            children: <Widget>[
              DrawerItem(_navbar[0].uItem1.toString(), Icons.home),
              DrawerItem7(_navbar[0].uItem2.toString(), Icons.contact_page),
              DrawerItem2(_navbar[0].uItem3.toString(), Icons.people),
              DrawerItem3(_navbar[0].uItem4.toString(), Icons.help),
              DrawerItem4(_navbar[0].uItem5.toString(), Icons.sell),
              DrawerItem5(_navbar[0].uItem6.toString(), Icons.login),
              DrawerItem6(_navbar[0].uItem7.toString(), Icons.library_add),
            ],
          ),
        );
      },
    );
  }
}
