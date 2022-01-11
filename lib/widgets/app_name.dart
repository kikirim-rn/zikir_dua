import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.12,
      left: size.width * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "En",
            style: TextStyle(
              fontFamily: 'FiraSans',
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.035,
              color: themeChange.darkTheme ? name : black,
            ),
          ),
          Text(
            "Güzel",
            style: TextStyle(
              fontFamily: 'FiraSans',
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.035,
              color: themeChange.darkTheme ? name : black,
            ),
          ),
          Text(
            "Dualar",
            style: TextStyle(
              fontFamily: 'FiraSans',
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.050,
              color: themeChange.darkTheme ? name : black,
            ),
          ),
        ],
      ),
    );
  }
}
