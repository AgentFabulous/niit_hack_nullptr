import 'package:flutter/material.dart';
import 'Page0.dart';
import 'Page1.dart';
import 'Page2.dart';

PageController pageControl;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: (page == 2)
            ? null
            : new AppBar(title: new Text("MedRooms"), centerTitle: true),
        body: new PageView(children: [
          new Page0(),
          new Page1(),
          new Page2(),
        ], controller: pageControl, onPageChanged: onPageChange),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.notifications),
              title: new Text("Notifications"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text("Profile"),
            ),
          ],
          onTap: navTapped,
          currentIndex: page,
        ));
  }

  @override
  void initState() {
    super.initState();
    pageControl = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageControl.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      this.page = page;
    });
  }

  void navTapped(int page) {
    pageControl.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
