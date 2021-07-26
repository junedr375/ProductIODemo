import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Getting App Theme Data
ThemeData getThemeData(BuildContext context) {
  return Theme.of(context);
}

///Light Theme for App
ThemeData appLightTheme() {
  return ThemeData(
      primaryColor: Colors.teal,
      primarySwatch: Colors.teal,
      buttonColor: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[200],
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white38,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        indicatorSize: TabBarIndicatorSize.label,
      ),
      backgroundColor: Colors.white,
      cardColor: Colors.black,
      accentColor: Colors.white,
      dividerColor: Colors.grey[700],
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: GoogleFonts.patrickHandScTextTheme(TextTheme(
        headline1: TextStyle(
            color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
        headline2: TextStyle(
            color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
        headline4: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        headline5: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        headline6: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      )),
      iconTheme: IconThemeData(color: Colors.black, size: 25));
}

///Dart Theme for app

ThemeData appDarkTheme() {
  return ThemeData(
      primaryColor: Colors.teal,
      primarySwatch: Colors.teal,
      buttonColor: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[900],
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white38,
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        indicatorSize: TabBarIndicatorSize.label,
      ),
      backgroundColor: Colors.black,
      cardColor: Colors.white,
      accentColor: Colors.white,
      dividerColor: Colors.white54,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: GoogleFonts.patrickHandScTextTheme(TextTheme(
        headline1: TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.w700),
        headline2: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        headline3: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        headline4: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        headline5: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        headline6: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        bodyText1: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(
            color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.w400),
        subtitle1: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      )),
      iconTheme: IconThemeData(color: Colors.white, size: 25));
}
