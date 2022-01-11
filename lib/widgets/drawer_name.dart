import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';

class DrawerAppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                scale: 1.5,
                child: Switch(
                  inactiveThumbImage: AssetImage("assets/images/gunes.png"),
                  activeThumbImage: AssetImage("assets/images/gece.png"),
                  activeColor: teal,
                  value: themeChange.darkTheme,
                  onChanged: (value) {
                    themeChange.darkTheme = value;
                  },
                ),
              ),
              Text(
                "En\nGüzel",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.030,
                  fontFamily: 'FiraSans',
                  color: themeChange.darkTheme ? grey200 : black54,
                ),
              ),
              Text(
                "Dualar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FiraSans',
                  color: themeChange.darkTheme ? grey200 : black54,
                  fontSize: height * 0.045,
                ),
              ),
            ],
          ),
          themeChange.darkTheme
              ? Image.asset(
                  'assets/images/allah.png',
                  height: height * 0.13,
                  color: grey400,
                )
              : Image.asset('assets/images/allahs.png', height: height * 0.13),
        ],
      ),
    );
  }
}
