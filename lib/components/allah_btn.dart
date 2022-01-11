import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/animations/bottom_animation.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';

class AllahBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(
              side: BorderSide(
                width: 1,
                color: borderSide,
              ),
            ),
            primary: themeChange.darkTheme ? teal900 : white,
            onPrimary: themeChange.darkTheme ? black : white,
          ),
          onPressed: () => Navigator.pushNamed(context, '/allahList'),
          child: WidgetAnimator(
            Center(
              child: Text(
                'Allah\'ın İsimleri',
                style: TextStyle(
                    fontSize: height * 0.032,
                    fontFamily: 'FiraSans',
                    fontWeight: FontWeight.w400,
                    color: themeChange.darkTheme ? white : black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
