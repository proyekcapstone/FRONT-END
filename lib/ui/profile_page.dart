import 'package:capstone_project_jti/common/style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: softColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Container(
                height: size.height * 0.3,
                decoration: BoxDecoration(color: primaryColor),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  'Hello Strangers',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Positioned(
                  top: 100,
                  right: 40,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: Icon(Icons.person),
                  )),
              Positioned(
                  top: 230,
                  left: 20,
                  right: 20,
                  child: SingleChildScrollView(
                    child: Container(
                      height: 400,
                      width: 300,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Favorite',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Settings',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Notification',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Icon(Icons.radio_button_checked)
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'About',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Logout',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ])
          ],
        ),
      )),
    );
  }
}
