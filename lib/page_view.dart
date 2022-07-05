import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/db/database_helper.dart';
import 'package:capstone_project_jti/helpers/notification_helper.dart';
import 'package:capstone_project_jti/provider/destination/database_destination_provider.dart';

/* UI */
import 'package:capstone_project_jti/ui/destination/detail_page.dart';
import 'package:capstone_project_jti/ui/destination/home_page.dart';
import 'package:capstone_project_jti/ui/favorite_page.dart';
import 'package:capstone_project_jti/ui/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class MyPageView extends StatefulWidget {
  static const routeName = '/page-view';

  const MyPageView({Key key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  int pageIndex = 0;

  final List<Widget> page = [
    const DestinationHomePage(),
    ChangeNotifierProvider<DatabaseDestinationProvider>(
      create: (_) =>
          DatabaseDestinationProvider(databaseHelper: DatabaseHelper()),
      child: const FavoritePage(),
    ),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(DestinationDetailPage.routeName);

    if (FirebaseAuth.instance.currentUser.emailVerified == false) {
      GoogleSignIn().signOut();
      FirebaseAuth.instance.signOut();
    }
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        onTap: onTapped,
        selectedItemColor: softColor,
        unselectedItemColor: secondaryColor,
      ),
    );
  }
}
