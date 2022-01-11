import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/screens/home_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  maxSlide: MediaQuery.of(context).size.width * 0.835,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final splashblack = Image.asset("assets/images/splash.png");
    final splashWhite = Image.asset("assets/images/splashb.png");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? teal900 : white,
      body: Center(
        child: Container(
          width: size.width * 12.0,
          height: size.height * 12.0,
          child: themeChange.darkTheme ? splashblack : splashWhite,
        ),
      ),
    );
  }
}
