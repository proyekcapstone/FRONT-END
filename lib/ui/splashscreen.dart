import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common/style.dart';
import 'auth/login_page.dart';

class Splashscreenpage extends StatefulWidget {
  static const routeName = '/splashscreen';

  @override
  State<Splashscreenpage> createState() => _SplashscreenpageState();
}

class _SplashscreenpageState extends State<Splashscreenpage> {
  @override
  void initState() {
    super.initState();
    startSpalshScreen();
  }

  startSpalshScreen() async {
    var durasi = const Duration(seconds: 5);
    return Timer(durasi, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const LoginPage();
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
                width: 80,
              ),
              Text('Jogja Travel Information',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.25)),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
        ),
      ),
    );
  }
}
