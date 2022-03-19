import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconnexz/API/api.dart';
import 'package:iconnexz/Models/Image.dart';
import 'package:iconnexz/Models/Sidebar.dart';
import 'package:sizer/sizer.dart';

class Sidenav extends StatefulWidget {
  Sidenav(this.selectedIndex, this.setIndex);

  final Function setIndex;
  final int selectedIndex;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Sidenav> {
  late int selectedIndex;
  late Function setIndex;
  final List<Sidebar> _sidebar = [];
  final List<Image1> _image = [];

  @override
  void initState() {
    fetchSidebar().then((value) {
      setState(() {
        _sidebar.addAll(value);
      });
    });
    fetchImage().then((value) {
      setState(() {
        _image.addAll(value);
      });
    });
    super.initState();
    selectedIndex = widget.selectedIndex;
    setIndex = widget.setIndex;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Drawer(
            child: ListView.builder(
                itemCount: _image == null
                    ? 0
                    : (_image.length > 1 ? 1 : _image.length) & _sidebar.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 55.0,
                            child: DrawerHeader(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      _image[0].imageFilePath.toString()),
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
                        _navItem(context, "assets/icons/menu_dashbord.svg",
                            _sidebar[0].item1.toString(), onTap: () {
                          _navItemClicked(context, 0);
                          Navigator.pushNamed(context, '/Dashboard');
                        }, selected: selectedIndex == 0),
                        _navItem(context, 'assets/icons/menu_profile.svg',
                            _sidebar[0].item2.toString(), onTap: () {
                          _navItemClicked(context, 1);
                          Navigator.of(context).pushNamed('/VendorAccountEdit');
                          // Navigator.pushNamed(context, '/VendorAccountEdit');
                        }, selected: selectedIndex == 1),
                        _navItem(context, 'assets/icons/menu_doc.svg',
                            _sidebar[0].item3.toString(), onTap: () {
                          _navItemClicked(context, 2);
                          Navigator.pushNamed(context, '/ManageService');
                        }, selected: selectedIndex == 2),
                        ExpansionTile(
                          tilePadding: EdgeInsets.only(left: 17),
                          title: Text(_sidebar[0].item4.toString(),
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 16)),
                          leading: Icon(Icons.shopping_cart,
                              color: Colors.white54, size: 20),
                          collapsedIconColor: Colors.white54,
                          iconColor: Colors.white54,
                          children: <Widget>[
                            _navItem(context, 'assets/icons/Documents.svg',
                                _sidebar[0].item5.toString(), onTap: () {
                              _navItemClicked(context, 3);
                              Navigator.pushNamed(context, '/Orders');
                            }, selected: selectedIndex == 3),
                          ],
                        ),
                        _navItem(context, 'assets/icons/menu_store.svg',
                            _sidebar[0].item6.toString(), onTap: () {
                          _navItemClicked(context, 5);
                          Navigator.pushNamed(context, '/Wallet');
                        }, selected: selectedIndex == 5),
                        _navItem(context, 'assets/icons/tag.svg',
                            _sidebar[0].item7.toString(), onTap: () {
                          _navItemClicked(context, 6);
                          Navigator.pushNamed(context, '/Voucher');
                        }, selected: selectedIndex == 6),
                        // _navItem(context, 'assets/icons/folder.svg',
                        //     _sidebar[0].item8.toString(), onTap: () {
                        //   _navItemClicked(context, 7);
                        //   Navigator.pushNamed(context, '/Reports');
                        // }, selected: selectedIndex == 7),
                        // _navItem(context, 'assets/icons/folder.svg', 'Reports',
                        //     onTap: () {
                        //   _navItemClicked(context, 7);
                        //   Navigator.pushNamed(context, '/Reports');
                        // }, selected: selectedIndex == 7),
                      ],
                    ),
                  );
                })));
  }

  _navItem(BuildContext context, String svgSrc, String text,
          {Text? suffix, void Function()? onTap, bool selected = false}) =>
      Container(
        color: selected ? Color(0xFF212332) : Colors.transparent,
        child: ListTile(
          leading: SvgPicture.asset(
            svgSrc,
            color: selected ? Theme.of(context).primaryColor : Colors.white54,
            height: 16,
          ),
          trailing: suffix,
          title: Text(text,
              style: TextStyle(
                  color: selected
                      ? Theme.of(context).primaryColor
                      : Colors.white54,
                  fontSize: 16)),
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
