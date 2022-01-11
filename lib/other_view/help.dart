import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/screens/my_drawer.dart';
import 'package:zikirdua/widgets/app_version.dart';
import 'package:zikirdua/widgets/custom_image.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? teal900 : white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              image: themeChange.darkTheme
                  ? 'assets/images/allah.png'
                  : 'assets/images/allahs.png',
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            HelpBackBtn(),
            CustomTitle(title: "Yardım Rehberi"),
            HelpGuide(),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}

class HelpGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, height * 0.1),
      child: ListView(
        children: [
          Column(
            children: [
              Text(
                "1. Puan ve Geribildirim",
                style: TextStyle(fontFamily: 'FiraSans', fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Platform.isIOS
                      ? Text(
                          "Değerli geribildiriminizi verebilir ve uygulamamızı AppStore'da değerlendirebilirsiniz.",
                          style: TextStyle(
                            fontFamily: 'FiraSans',
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          "Değerli geribildiriminizi verebilir ve uygulamamızı GooglePlay'de değerlendirebilirsiniz.",
                          style: TextStyle(
                            fontFamily: 'FiraSans',
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "2. Hata Bildirme",
                style: TextStyle(fontFamily: 'FiraSans', fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Bu ZikirDua bağlamında herhangi bir hata görürseniz lütfen aşağıdaki bağlantıdan bildirin.",
                    style: TextStyle(
                      fontFamily: 'FiraSans',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: themeChange.darkTheme ? teal900 : white,
                  maximumSize: Size(150, 40),
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      width: width * 0.0030,
                      color: borderSide,
                    ),
                  ),
                ),
                child: Text(
                  "Hata Bildir",
                  style: TextStyle(
                    fontFamily: 'FiraSans',
                    fontSize: 14,
                    color: themeChange.darkTheme ? white : black,
                  ),
                ),
                onPressed: () =>
                    launch("http://kikirim.blogspot.com/p/zikir-dualar.html"),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "3. Mevcut Kod",
                style: TextStyle(fontFamily: 'FiraSans', fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "ZikirDua aşağıdaki bağlantıda izin verilmeyen uygun LİSANS'a sahiptir.",
                    style: TextStyle(
                      fontFamily: 'FiraSans',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: themeChange.darkTheme ? teal900 : white,
                  maximumSize: Size(150, 40),
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      width: width * 0.0030,
                      color: borderSide,
                    ),
                  ),
                ),
                child: Text(
                  "Gizlilik Politikası",
                  style: TextStyle(
                    fontFamily: 'FiraSans',
                    fontSize: 14,
                    color: themeChange.darkTheme ? white : black,
                  ),
                ),
                onPressed: () => launch(
                  "https://sites.google.com/view/zikirdua-privacypolicy/ana-sayfa",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "4. Geliştirici Bilgisi",
                style: TextStyle(fontFamily: 'FiraSans', fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Name: Levent Akgün \nEmail: leventakgun06@gmail.com \nGitHub: https://github.com/kikirim-rn/ \nWebsite: http://kikirim.blogspot.com/",
                    style: TextStyle(
                      fontFamily: 'FiraSans',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GuideContainer extends StatelessWidget {
  final String title;
  final String guideDescription;
  final int guideNo;

  GuideContainer(
      {required this.guideNo,
      required this.title,
      required this.guideDescription});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            "\n$guideNo. $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
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
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.16,
      left: width * 0.06,
      child: Shimmer.fromColors(
        baseColor: themeChange.darkTheme ? white : black,
        highlightColor: themeChange.darkTheme ? grey : green,
        enabled: true,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                fontFamily: 'FiraSans',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class HelpBackBtn extends StatelessWidget {
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
          Get.back(result: () => MyDrawer());
        },
      ),
    );
  }
}
