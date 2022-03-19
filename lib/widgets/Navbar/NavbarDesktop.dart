import 'package:flutter/material.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Image.dart';
import 'package:iconnexz/Models/Navbar.dart';
import 'package:iconnexz/widgets/Navbar/NavBarItem.dart';
import 'package:iconnexz/widgets/Navbar/navbar_logo.dart';

class NavbarDesktop extends StatefulWidget {
  NavbarDesktop({Key? key}) : super(key: key);

  @override
  _NavbarDesktopState createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<NavbarDesktop> {
  List<Navbar> _navbar = [];
  List<Image1> _image = [];

  @override
  void initState() {
    fetchNavbar().then((value) {
      setState(() {
        _navbar.addAll(value);
      });
    });
    fetchImage().then((value) {
      setState(() {
        _image.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  ListView.builder

    return ListView.builder(
        itemCount:
            _navbar == null ? 0 : (_navbar.length > 1 ? 1 : _navbar.length),
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Color(0xff042E44),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                NavBarLogo(
                  press: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NavbarItem(
                      title: _navbar[0].uItem1.toString(),
                      // title: "Home",
                      press: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem2.toString(),
                      // title: "Contact Us",
                      press: () {
                        Navigator.pushNamed(context, '/Contact');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem3.toString(),
                      // title: "Suggest A Vendor",
                      press: () {
                        Navigator.pushNamed(context, '/Suggest');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem4.toString(),
                      // title: "FAQ",
                      press: () {
                        Navigator.pushNamed(context, '/FAQ');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem5.toString(),
                      // title: "Become A Vendor",
                      press: () {
                        Navigator.pushNamed(context, '/BecomeAVendor');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem6.toString(),
                      // title: "Login",
                      press: () {
                        Navigator.pushNamed(context, '/Login');
                      },
                    ),
                    NavbarItem(
                      title: _navbar[0].uItem7.toString(),
                      //title: "Sign Up",
                      press: () {
                        Navigator.pushNamed(context, '/Signup');
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
