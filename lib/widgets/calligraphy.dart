import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';

class Calligraphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      right: width * 0.06,
      top: height * 0.055,
      child: themeChange.darkTheme
          ? Image.asset(
              "assets/images/allah.png",
              height: height * 0.14,
              color: grey400,
            )
          : Image.asset(
              "assets/images/allahs.png",
              height: height * 0.14,
            ),
    );
  }
}
