import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData baseTheme = ThemeData(

        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffFEFFD4), // home page background color
          secondary: const Color(0xff2D2D2D), // dark gray
          tertiary: const Color(0xffCB9700), // yellow
        ),

        // fontFamily: GoogleFonts.lato().fontFamily,

        /* textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black),
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.black),
        ), */
      );
}