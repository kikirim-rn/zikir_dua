import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/screens/dua_list.dart';
import 'package:zikirdua/widgets/quran_rail.dart';

class DuaDetail extends StatefulWidget {
  DuaDetail({Key? key, required this.data}) : super(key: key);

  dynamic data;

  @override
  _DuaDetailState createState() => _DuaDetailState();
}

class _DuaDetailState extends State<DuaDetail> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeChange.darkTheme ? teal900 : white, //ayetlerin arkaplan rengi
      body: SafeArea(
        child: Stack(
          children: [
            DuaBackBtn(),
            Besmele(
              title: widget.data["besmele"],
            ),
            CustomTitle(
              title: widget.data["name"],
            ),
            ShareInfo(
              descp: widget.data["descp"],
            ),
            QuranRail(),
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  final String? descp;
  ShareInfo({required this.descp});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.02),
          Text(descp!,
              style:
                  TextStyle(fontSize: height * 0.026, fontFamily: 'FiraSans')),
        ],
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  final String? title;

  CustomTitle({this.title});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Positioned(
      top: height * 0.16,
      left: 0,
      right: 0, //width * 0.12,
      child: Shimmer.fromColors(
        baseColor: themeChange.darkTheme ? white : black,
        highlightColor: themeChange.darkTheme ? grey : green,
        enabled: true,
        child: Text(
          title!,
          style: TextStyle(
              fontFamily: 'FiraSans',
              fontSize: height * 0.032,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Besmele extends StatelessWidget {
  final String? title;

  Besmele({this.title});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.26,
      left: 0,
      right: 0,
      child: Shimmer.fromColors(
        baseColor: themeChange.darkTheme ? white : black,
        highlightColor: themeChange.darkTheme ? grey : green,
        enabled: true,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                fontFamily: 'FiraSans',
                fontSize: height * 0.050,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DuaBackBtn extends StatelessWidget {
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
          Get.to(() => DuaList());
        },
      ),
    );
  }
}
