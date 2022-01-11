
import 'package:flutter/material.dart';

class ThemeStyles {
  static ThemeData themeData(bool isDarkTheme, BuildContext buildContext) {
    return isDarkTheme
        ? ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            brightness: Brightness.dark,
            backgroundColor: Color(0xFF212121),
            dividerColor: Colors.black12,
            fontFamily: 'FiraSans',
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 42,
                  fontWeight: FontWeight.w600),
              headline2: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
              bodyText1: TextStyle(
                  fontFamily: "FiraSans",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              caption: TextStyle(fontFamily: "FiraSans", fontSize: 14),
            ),
          )
        : ThemeData(
            primarySwatch: Colors.orange,
            primaryColor: Colors.orange,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            dividerColor: Colors.white60,
            fontFamily: 'FiraSans',
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 42,
                  fontWeight: FontWeight.w600),
              headline2: TextStyle(
                  fontFamily: 'FiraSans',
                  fontSize: 28,
                  fontWeight: FontWeight.w600),
              bodyText1: TextStyle(
                  fontFamily: "FiraSans",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              caption: TextStyle(fontFamily: "FiraSans", fontSize: 14),
            ),
          );
  }
}
