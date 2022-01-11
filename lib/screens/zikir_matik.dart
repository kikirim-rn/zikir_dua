import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';

class ZikirMatik extends StatefulWidget {
  @override
  _ZikirMatikState createState() => _ZikirMatikState();
}

class _ZikirMatikState extends State<ZikirMatik> {
  _patternVibrate() {
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 100),
    );
  }

  double progress = 0;
  currentProgressColor() {
    if (progress >= 0.1 && progress < 0.3) {
      return orange;
    }
    if (progress >= 0.5 && progress < 0.7) {
      return blue;
    }
    if (progress >= 0.9) {
      return red;
    } else {
      return purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? teal900 : white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text('ZikirMatik'),
        centerTitle: true,
        backgroundColor: themeChange.darkTheme ? teal900 : white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _progressCircle(size),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text(
                  'Yeniden',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                    fontFamily: 'FiraSans',
                    color: themeChange.darkTheme ? white : black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: themeChange.darkTheme ? teal900 : teal50,
                  maximumSize: Size(150, 50),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    side: BorderSide(
                      width: size.width * 0.0030,
                      color: borderSide,
                    ),
                  ),
                ),
                onPressed: () {
                  final updated = ((progress = 0.0).clamp(0.0, 0.0) * 100);
                  setState(() {
                    progress = updated.round() / 100;
                  });
                },
              ),
              ElevatedButton(
                child: Text(
                  'Başla',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.02,
                    fontFamily: 'FiraSans',
                    color: themeChange.darkTheme ? white : black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: themeChange.darkTheme ? teal900 : teal50,
                  maximumSize: Size(150, 50),
                  minimumSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    side: BorderSide(
                      width: size.width * 0.0030,
                      color: borderSide,
                    ),
                  ),
                ),
                onPressed: () {
                  final updated = ((progress + 0.01).clamp(0.0, 1.0) * 100);
                  setState(() {
                    progress = updated.round() / 100;
                    _patternVibrate();
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _progressCircle(size) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return CircularPercentIndicator(
      radius: size.width * 0.7,
      lineWidth: size.width * 0.06,
      animation: true,
      animationDuration: 3000,
      percent: progress,
      animateFromLastPercent: true,
      backgroundColor: themeChange.darkTheme ? teal100 : teal100,
      progressColor: currentProgressColor(),
      circularStrokeCap: CircularStrokeCap.round,
      center: Text(
        "${progress}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text(
          "Bismillahirrahmanirrahiym",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.06,
            fontFamily: 'FiraSans',
            color: themeChange.darkTheme ? white : black,
          ),
        ),
      ),
      widgetIndicator: RotatedBox(
        quarterTurns: 1,
        child: Image.asset(
          "assets/images/airplane.png",
          width: 30,
          height: 30,
          color: themeChange.darkTheme ? teal400 : teal400,
        ),
      ),
    );
  }
}
