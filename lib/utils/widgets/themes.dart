import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // ------------------ LIGHT THEME ------------------
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: darkBluishColor,
        secondaryHeaderColor: Vx.black,
        colorScheme: ColorScheme.light(
          primary: darkBluishColor,
          secondary: lightBluishColor,
          surface: Colors.white,
          background: creamColor,
          onSurface: Colors.black,
        ),
        cardColor: Colors.white,
        canvasColor: creamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).copyWith(
          bodySmall: const TextStyle(color: Colors.black),  // caption
          bodyMedium: const TextStyle(color: Colors.black), // regular text
          bodyLarge: const TextStyle(color: Colors.black),  // headings
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          toolbarTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkBluishColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );

  // ------------------ DARK THEME ------------------
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: lightBluishColor,
        secondaryHeaderColor: Vx.white,
        colorScheme: ColorScheme.dark(
          primary: lightBluishColor,
          secondary: darkBluishColor,
          surface: darkCreamColor,
          background: darkCreamColor,
          onSurface: Colors.white,
        ),
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
          bodySmall: const TextStyle(color: Colors.white),  // caption
          bodyMedium: const TextStyle(color: Colors.white), // regular text
          bodyLarge: const TextStyle(color: Colors.white),  // headings
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          toolbarTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: lightBluishColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        
      );

  // ------------------ COLORS ------------------
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
