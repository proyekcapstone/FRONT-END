import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFBDA899);
const Color secondaryColor = Color(0xFF90735F);
const Color softColor = Color(0xFFFDF0E7);
<<<<<<< HEAD
=======
const Color darkPrimaryColor = Color(0xFF202020);

ThemeData lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: Colors.brown[700],
        secondary: secondaryColor,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  textTheme: myTextTheme,
  primaryColor: primaryColor,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: darkPrimaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(elevation: 0),
  textTheme: myTextTheme,
  primaryColor: secondaryColor,
);
>>>>>>> 2b7db54 (final commit)

final myTextTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.montserrat(
      fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.5),
  headline3: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ),
  headline4: GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.25),
  headline5: GoogleFonts.montserrat(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle2: GoogleFonts.montserrat(
      fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 0.15),
  bodyText1: GoogleFonts.roboto(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.roboto(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.roboto(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
