import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

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
                decoration: const BoxDecoration(color: primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Hello Strangers',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
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
                    child: const Icon(Icons.person),
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
                            Container(
                              margin: const EdgeInsets.only(top: 60),
                              child: Text(
                                'Profile',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'Favorite',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(height: 15.0),
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
                                const Icon(Icons.radio_button_checked)
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'About',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(height: 15.0),
                            Text(
                              'Logout',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
            ]),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40),
                ),
                child: const Text('Sign Out'),
                onPressed: () async {
                  await context.read<FirebaseAuthMethods>().signOut(context);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
