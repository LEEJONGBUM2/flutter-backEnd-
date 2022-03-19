import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Sidebar.dart';

class SidenavMobile extends StatefulWidget {
  final Function setIndex;
  final int selectedIndex;

  SidenavMobile(this.selectedIndex, this.setIndex);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SidenavMobile> {
  late int selectedIndex;
  late Function setIndex;
  List<Sidebar> _sidebar = [];

  @override
  void initState() {
    fetchSidebar().then((value) {
      setState(() {
        _sidebar.addAll(value);
      });
    });
    super.initState();
    selectedIndex = widget.selectedIndex;
    setIndex = widget.setIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView.builder(
            itemCount: _sidebar == null
                ? 0
                : (_sidebar.length > 1 ? 1 : _sidebar.length),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 55.0,
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Iconnexz.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                          child: null,
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.white,
                    ),
                    _navItem(context, 'assets/icons/menu_dashbord.svg',
                        onTap: () {
                      _navItemClicked(context, 0);
                      Navigator.pushNamed(context, '/Dashboard');
                    }, selected: selectedIndex == 0),
                    _navItem(context, 'assets/icons/menu_profile.svg',
                        onTap: () {
                      _navItemClicked(context, 1);
                      Navigator.of(context).pushNamed('/VendorAccountEdit');
                      // Navigator.pushNamed(context, '/VendorAccountEdit');
                    }, selected: selectedIndex == 1),
                    _navItem(context, 'assets/icons/menu_doc.svg', onTap: () {
                      _navItemClicked(context, 2);
                      Navigator.pushNamed(context, '/ManageService');
                    }, selected: selectedIndex == 2),
                    ExpansionTile(
                      title: Icon(Icons.shopping_cart,
                          color: Colors.white54, size: 20),
                      trailing: SizedBox.shrink(),
                      children: <Widget>[
                        _navItem(context, 'assets/icons/Documents.svg',
                            onTap: () {
                          _navItemClicked(context, 3);
                          Navigator.pushNamed(context, '/Orders');
                        }, selected: selectedIndex == 3),
                        _navItem(context, 'assets/icons/drop_box.svg',
                            onTap: () {
                          _navItemClicked(context, 4);
                          Navigator.pushNamed(context, '/OrderHistory');
                        }, selected: selectedIndex == 4),
                      ],
                    ),
                    _navItem(context, 'assets/icons/menu_store.svg', onTap: () {
                      _navItemClicked(context, 5);
                      Navigator.pushNamed(context, '/Wallet');
                    }, selected: selectedIndex == 5),
                    _navItem(context, 'assets/icons/tag.svg', onTap: () {
                      _navItemClicked(context, 6);
                      Navigator.pushNamed(context, '/Voucher');
                    }, selected: selectedIndex == 6),
                    // _navItem(context, 'assets/icons/folder.svg', onTap: () {
                    //   _navItemClicked(context, 7);
                    //   Navigator.pushNamed(context, '/Reports');
                    // }, selected: selectedIndex == 7),
                  ],
                ),
              );
            }));
  }

  _navItem(BuildContext context, String svgSrc,
          {void Function()? onTap, bool selected = false}) =>
      Container(
        color: selected ? Color(0xFF212332) : Colors.transparent,
        child: ListTile(
          leading: SvgPicture.asset(
            svgSrc,
            color: selected ? Theme.of(context).primaryColor : Colors.white54,
            height: 16,
          ),
          selected: selected,
          onTap: onTap,
        ),
      );

  _navItemClicked(
    BuildContext context,
    int index,
  ) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}
