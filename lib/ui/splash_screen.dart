import 'dart:async';

import 'package:capstone_project_jti/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/style.dart';
import 'auth/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  static const routeName = '/splash-screen';

  const SplashScreenPage({Key key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSpalshScreen();
  }

  startSpalshScreen() async {
    var durasi = const Duration(seconds: 3);
    return Timer(durasi, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const AuthWrapper();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/jti.png',
                width: 100,
              ),
              Text('Jogja Travel Information',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.25)),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          color: primaryColor,
        ),
      ),
    );
  }
}
