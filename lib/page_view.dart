import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/ui/detail_page.dart';
import 'package:capstone_project_jti/ui/home_page.dart';
import 'package:capstone_project_jti/ui/profile_page.dart';
import 'package:capstone_project_jti/ui/search_page.dart';
import 'package:flutter/material.dart';

class myPageView extends StatefulWidget {
  static const routeName = '/page_view';

  const myPageView({Key key}) : super(key: key);

  @override
  _myPageViewState createState() => _myPageViewState();
}

class _myPageViewState extends State<myPageView> {
  int pageIndex = 0;

  final List<Widget> page = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  void onTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: secondaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: secondaryColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: secondaryColor,
            ),
            label: 'Profile',
          ),
        ],
        onTap: onTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
