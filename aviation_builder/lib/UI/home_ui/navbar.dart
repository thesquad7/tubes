import 'package:aviation_builder/UI/home_ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Nav extends StatefulWidget{
  @override
  navbar createState() => navbar();
}
class navbar extends State<Nav>{
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final screen = [
      Home(),
      Popular(),
      News(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
        backgroundColor: Colors.orange,
        appBar: AppBar(centerTitle: true,title: Text("Aviation Builder"),elevation: 0,backgroundColor: Colors.transparent,leading: Container(),),
        bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child:CurvedNavigationBar(
          color: Colors.indigoAccent,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.cyan,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        ),
        body: screen[_page],
    );
  }
}