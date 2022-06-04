import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/widgets/detail_page.dart';
import 'package:capstone_project_jti/widgets/home.dart';
import 'package:capstone_project_jti/widgets/profile_page.dart';
import 'package:flutter/material.dart';

class PageViewNew extends StatefulWidget {
  static const routeName = '/page_view';

  const PageViewNew({Key key}) : super(key: key);

  @override
  _PageViewNewState createState() => _PageViewNewState();
}

class _PageViewNewState extends State<PageViewNew> {
  int pageIndex = 0;

  final List<Widget> page = [
    HomeWidget(),
    ProfileWidget(),
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
            label: 'Home Page',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search Page',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Profile Page',
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
