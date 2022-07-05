import 'dart:io';

import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/provider/firebase_auth_methods.dart';
import 'package:capstone_project_jti/provider/preferences_provider.dart';
import 'package:capstone_project_jti/provider/scheduling_provider.dart';
import 'package:capstone_project_jti/ui/about_page.dart';
import 'package:capstone_project_jti/ui/auth/login_page.dart';
import 'package:capstone_project_jti/utils/custom_dialog.dart';
import 'package:capstone_project_jti/utils/show_snackbar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  _signOut(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to sign out?'),
            actions: [
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
                isDefaultAction: false,
                isDestructiveAction: false,
              ),

              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () async {
                  await GoogleSignIn().signOut();
                  await context.read<FirebaseAuthMethods>().signOut(context);
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                },
                child: const Text('Yes'),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<PreferencesProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 280.0,
                      decoration: const BoxDecoration(color: primaryColor),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(top: 50.0),
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 4,
                                color: secondaryColor,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'https://ui-avatars.com/api/?name=${user.displayName}&bold=true',
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user.displayName,
                          style: Theme.of(context).textTheme.headline3,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          user.email,
                          style: Theme.of(context).textTheme.labelLarge,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Material(
                    child: ListTile(
                      leading: const Icon(Icons.color_lens),
                      title: const Text(
                        'Ubah Tema',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: CupertinoSwitch(
                        value: provider.isDarkTheme,
                        onChanged: (value) {
                          provider.enableDarkTheme(value);
                          if (value) {
                            showSnackBar(context, 'Mode Gelap Aktif!');
                          } else {
                            showSnackBar(context, 'Mode Terang Aktif!');
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Material(
                    child: ListTile(
                      leading: const Icon(Icons.alarm),
                      title: const Text(
                        'Notifikasi',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      trailing: Consumer<SchedulingProvider>(
                        builder: (context, scheduled, _) {
                          return CupertinoSwitch(
                            value: provider.isDailyDestinationActive,
                            onChanged: (value) async {
                              if (Platform.isIOS) {
                                customDialog(context);
                              } else {
                                scheduled.scheduleDestination(value);
                                provider.enableDailyDestination(value);

                                if (value) {
                                  showSnackBar(
                                      context, 'Notifikasi Diaktifkan!');
                                } else {
                                  showSnackBar(
                                      context, 'Notificasi Dimatikan!');
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Material(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AboutPage.routeName);
                      },
                      leading: const Icon(Icons.info),
                      title: const Text(
                        'About',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Material(
                    child: ListTile(
                      onTap: () {
                        _signOut(context);
                      },
                      leading: const Icon(Icons.logout),
                      title: const Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
