import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zikirdua/screens/home_screen.dart';

class BackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        splashColor: Color(0xff04364f),
        iconSize: MediaQuery.of(context).size.height * 0.04,
        tooltip: 'Back Button',
        onPressed: () {
          Get.to(() =>
              HomeScreen(maxSlide: MediaQuery.of(context).size.width * 0.835));
        },
      ),
    );
  }
}
