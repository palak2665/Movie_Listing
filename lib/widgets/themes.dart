import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        primaryColor: const Color(0xff131217).withOpacity(0.9),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          bodyText2: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
            fontFamily: GoogleFonts.notoSans().fontFamily,
          ),
          headline2: const TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(
            color: Colors.grey[600],
            fontSize: 17.0,
          ),
        ),
      );
}
