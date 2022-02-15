import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Color(0xFFFE3C5B),
    primaryColorDark: Color(0xFFFC0028),
    primaryColorLight: Color(0xFFFE9AAA),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFFF5F5F5),
    splashColor: Color(0xFFFE9AAA),
    textTheme: TextTheme(
      headline1: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 36,
        ),
      ),
      headline2: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      headline3: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      headline4: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      headline5: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      headline6: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      bodyText1: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
      ),
      bodyText2: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
      ),
    ),
  );
}
